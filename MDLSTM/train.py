import json
import os
import time

import numpy as np
import MDLSTM.loss_function as losses
import MDLSTM.utils as utils
import MDLSTM.datareader as readers
import MDLSTM.export_model as export_model
import MDLSTM.eval_util as eval_util
import MDLSTM.model as models

import tensorflow as tf
import tensorflow.contrib.slim as slim
from tensorflow import app, flags, gfile, logging
import MDLSTM.utils
from MDLSTM.utils import task_as_string

FLAGS = flags.FLAGS

if __name__ == "__main__":
    # Define dataset flags
    flags.DEFINE_string("train_dir", "./mdlstm_train/", "Directory to save models in")

    flags.DEFINE_string("train_data_pattern", "", "File glob for the training dataset")

    flags.DEFINE_string("test_data_pattern", "", "File Glob for the test set.")

    flags.DEFINE_string("feature_names", "mean_rgb", "Name of the feature to use for training")

    flags.DEFINE_string("feature_sizes", "1024", "Length of feature vectors")

    # Model Flags
    flags.DEFINE_bool("slice_features", True, "If set, the input should have 4 dimensions.")

    flags.DEFINE_string("vocab_path", "vocabulary.txt", "Which vocab to use in order to help prediction.")

    flags.DEFINE_bool("start_new_model", False, "If set, this will not resume from a checkpoint and will instead create a new model")

    flags.DEFINE_integer("width", 12, "Image width")

    flags.DEFINE_integer("height", 36, "Image height")

    flags.DEFINE_integer("slices", 15, "Slices number")

    flags.DEFINE_integer("Bwidth", 350, "Batch width")

    flags.DEFINE_integer("input_channels", 1, "input image depth")

    flags.DEFINE_integer("stride", -1, "Stride")

    flags.DEFINE_integer("vocabulary_size", 29, "Number of characters")

    flags.DEFINE_integer("beam_size", 2, "guess number")

    flags.DEFINE_integer("display_step", 3, "Display Step")

    flags.DEFINE_integer("display_step_lme", 6, "Display Step LME")

    #Training flags
    flags.DEFINE_integer("batch_size", 2, "How many examples to process per batch for training")

    flags.DEFINE_string("label_loss", "CTCLoss", "Which loss function to use for training")

    flags.DEFINE_float("regularization_penalty", 1, "How much weight to give regularization")

    flags.DEFINE_float("drop_out", 0.6, "Dropout probability")

    flags.DEFINE_float("base_learning_rate", 0.001, "What learning rate to start with")

    flags.DEFINE_float("learning_rate_decay", 0.95, "Learning rate decay factor")

    flags.DEFINE_float("learning_rate_decay_examples", 4000000, "Multiply current learning rate by learning_rate_decay")

    flags.DEFINE_integer("num_epochs", 50, "How many full DS passes to make")

    flags.DEFINE_integer("max_steps", 10, "The max number of iterations of the training loop")

    flags.DEFINE_integer("export_model_steps", 1000, "The period, in steps, between each update of the checkpoint.")

    # Other Flags
    flags.DEFINE_integer("num_readers", 2, "How many threads used to read input files")

    flags.DEFINE_string("optimizer", "AdamOptimizer", "What optimizer to use")

    flags.DEFINE_float("clip_gradient_norm", 1.0, "Norm to clip gradients to.")

    flags.DEFINE_bool("log_device_placement", False, "Whether to write the into the logs which op uses what device.")

def validate_class_name(flag_value, category, modules, expected_superclass):
    candidates = [getattr(module, flag_value, None) for module in modules]
    for candidate in candidates:
        if not candidate:
            continue
        if not issubclass(candidate, expected_superclass):
            raise flags.ValidationError("Unable to find {} '{}'.".format(category, flag_value))

def get_input_data_tensors(reader, data_pattern, batch_size=1000, num_epochs=None, num_readers=1, num_files=5, nameT='train'):
    logging.info("Using batch size of " + str(batch_size) + " for {}ing.".format(nameT))
    with tf.name_scope(nameT+"_input"):
        print(data_pattern)
        files = [data_pattern.format(j) for j in range(num_files)] if nameT=='train' else [data_pattern.format(j) for j in range(3)]
        if not files:
            raise IOError("Unable to find {}ing files. data_pattern'".format(nameT) + data_pattern + "'.")
        logging.info("Number of {}ing files: {}.".format(nameT, len(files)))
        if nameT == "test":
            filename_queue = tf.train.string_input_producer(files, shuffle=True)
        else:
            filename_queue = tf.train.string_input_producer(files, num_epochs=num_epochs, shuffle=True)
        training_data = [
            reader.prepare_reader(filename_queue, batch_size) for _ in range(num_readers)
        ]

        return tf.train.shuffle_batch_join(
            training_data,
            batch_size=batch_size,
            capacity=FLAGS.batch_size*5,
            min_after_dequeue=FLAGS.batch_size,
            allow_smaller_final_batch=True,
            enqueue_many=True
        )

def find_class_by_name(name, modules):
    modules = [getattr(module, name, None) for module in modules]
    return next(a for a in modules if a)

def build_graph(reader, model, train_data_pattern, label_loss_fn=losses.CTCLoss(),
                batch_size=100, base_learning_rate=0.01,
                learning_rate_decay_examples=1000000,
                learning_rate_decay=0.95,
                optimizer_class=tf.train.AdamOptimizer,
                clip_gradient_norm=1.0,
                regularization_penalty=1,
                num_readers=1,
                num_epochs=None,
                decoder=losses.CTCDecoder('beam_search')):
    global_step = tf.Variable(0, trainable=False, name="global_step")

    learning_rate = tf.train.exponential_decay(
        base_learning_rate,
        global_step * batch_size,
        learning_rate_decay_examples,
        learning_rate_decay,
        staircase=True
    )
    tf.summary.scalar("learning_rate", learning_rate)

    optimizer = optimizer_class(learning_rate)
    imageInput_tr, seq_len_tr, target_tr = (
        get_input_data_tensors(reader, train_data_pattern,
                               batch_size=batch_size,
                               num_readers=num_readers,
                               num_epochs=num_epochs)
    )
    imageInput_te, seq_len_te, target_te = (
        get_input_data_tensors(reader,
                               FLAGS.test_data_pattern,
                               batch_size=batch_size,
                               num_readers=num_readers,
                               num_epochs=num_epochs, nameT='test')
    )

    train_batch = tf.placeholder_with_default(True, [])

    imageInput, seq_len, target = tf.cond(
        train_batch,
        lambda: [imageInput_tr, seq_len_tr, target_tr],
        lambda: [imageInput_te, seq_len_te, target_te]
    )
    seq_len = tf.cast(seq_len, tf.int32)
    target = tf.cast(target, tf.int32)
    if FLAGS.stride == -1:
        imageInput1 = tf.reshape(imageInput, [FLAGS.batch_size*FLAGS.slices, FLAGS.height, FLAGS.width, FLAGS.input_channels])
    elif FLAGS.width == 1:
        imageInput1 = tf.reshape(imageInput, [FLAGS.batch_size, FLAGS.slices, FLAGS.height])
    else:
        imageInput1 = tf.reshape(imageInput, [FLAGS.batch_size, FLAGS.height, FLAGS.Bwidth, FLAGS.input_channels])
        print(imageInput1)
    seq_len1 = tf.reshape(seq_len, [FLAGS.batch_size])
    tf.summary.histogram("model/input_raw", imageInput)

    with tf.name_scope("model"):
        result = model.create_model(
            imageInput1,
            seq_len=seq_len1,
            vocab_size=reader.num_classes,
            is_training=train_batch,
            keep_prob=FLAGS.drop_out
        )
        for variable in slim.get_model_variables():
            tf.summary.histogram(variable.op.name, variable)

        predictions = result["predictions"]
        if "loss" in result.keys():
            label_loss = result["loss"]
        else:
            if FLAGS.stride != -1:
                seq_len1 = tf.maximum(tf.minimum(tf.floor_div(tf.maximum(seq_len1-FLAGS.width+2*FLAGS.stride, FLAGS.stride), FLAGS.stride), FLAGS.slices), 1)
                seq_len1 = tf.ones([FLAGS.batch_size], dtype=tf.int32)*FLAGS.slices
            seq_len1 = tf.ones([FLAGS.batch_size], dtype=tf.int32)*predictions.get_shape().as_list()[0]
            label_loss = label_loss_fn.calculate_loss(predictions, target, seq_len1)
        tf.summary.scalar("label_loss", label_loss)

        if "regularization_loss" in result.keys():
            reg_loss = result["regularization_loss"]
        else:
            reg_loss = tf.constant(0.0)

        reg_losses = tf.losses.get_regularization_losses()
        if reg_losses:
            reg_loss += tf.add_n(reg_losses)

        if regularization_penalty != 0:
            tf.summary.scalar("reg_loss", reg_loss)

        # Adds update_ops (Moving averages in batch normalization) as a dep to the training op
        update_ops = tf.get_collection(tf.GraphKeys.UPDATE_OPS)
        if "update_ops" in result.keys():
            update_ops += result["update_ops"]
        if update_ops:
            with tf.control_dependencies(update_ops):
                barrier = tf.no_op(name="gradient_barrier")
                with tf.control_dependencies([barrier]):
                    label_loss = tf.identity(label_loss)

        if decoder is not None:
            with tf.name_scope("Prediction"):
                decodedPrediction = decoder.decode(predictions, seq_len1, FLAGS.beam_size)
                ler = decoder.labelRateError(decodedPrediction, target)


        final_loss = regularization_penalty * reg_loss + label_loss
        train_op = slim.learning.create_train_op(
            final_loss,
            optimizer,
            global_step=global_step,
            clip_gradient_norm=clip_gradient_norm
        )

        tf.add_to_collection("global_step", global_step)
        tf.add_to_collection("loss", label_loss)
        tf.add_to_collection("predictions", tf.nn.softmax(predictions))
        tf.add_to_collection("input_batch", imageInput)
        tf.add_to_collection("seq_len", seq_len)
        tf.add_to_collection("train_batch", train_batch)
        tf.add_to_collection("ler", ler)
        decoders = []
        for i in range(FLAGS.beam_size):
            tf.add_to_collection("decodedPrediction{}".format(i), tf.sparse_tensor_to_dense(decodedPrediction[i]))
        tf.add_to_collection("labels", tf.sparse_tensor_to_dense(target))
        tf.add_to_collection("train_op", train_op)

class Trainer(object):
    def __init__(self, task, train_dir, model, reader, model_exporter,
                 log_device_placement=True, max_steps=None, export_model_steps=1000):
        self.task=task
        self.train_dir = train_dir
        self.config = tf.ConfigProto(log_device_placement=log_device_placement)
        self.model = model
        self.reader = reader
        self.model_exporter = model_exporter
        self.max_steps=max_steps
        self.max_steps_reached = False
        self.export_model_steps = export_model_steps
        self.last_model_export_step = 0

    def remove_training_directory(self, train_dir):
        try:
            logging.info("{}: Removing Existing training directory.".format(task_as_string(self.task)))
            gfile.DeleteRecursively(train_dir)
        except:
            logging.error(
                "Failed to delete directory"
            )

    def run(self, start_new_model=False):
        if start_new_model:
            self.remove_training_directory(self.train_dir)

        meta_filename = self.get_meta_filename(start_new_model, self.train_dir)

        with tf.Graph().as_default() as graph:
            if meta_filename:
                saver = self.recover_model(meta_filename)

            if not meta_filename:
                saver = self.build_model(self.model, self.reader)

            global_step = tf.get_collection("global_step")[0]
            loss = tf.get_collection("loss")[0]
            predictions = tf.get_collection("predictions")[0]
            labels = tf.get_collection("labels")[0]
            train_batch = tf.get_collection("train_batch")[0]
            train_op = tf.get_collection("train_op")[0]

            decodedPrediction = []
            for i in range(FLAGS.beam_size):
                decodedPrediction.append(tf.get_collection("decodedPrediction{}".format(i))[0])
            ler = tf.get_collection("ler")[0]
            init_op = tf.global_variables_initializer()

            sv = tf.train.Supervisor(
                graph,
                logdir=self.train_dir,
                init_op=init_op,
                is_chief=True,
                global_step=global_step,
                save_model_secs=15 * 60,
                save_summaries_secs=120,
                saver=saver
            )

            logging.info("{}: Starting managed session.".format(task_as_string(self.task)))
            with sv.managed_session("", config=self.config) as sess:
                try:
                    logging.info("{}: Entering training loop.".format(task_as_string(self.task)))
                    decodedPr = None; labels_val=None; global_step_val=None
                    while (not sv.should_stop()) and (not self.max_steps_reached):
                        batch_start_time = time.time()
                        _, global_step_val = sess.run([train_op, global_step])
                        seconds_per_batch = time.time() - batch_start_time

                        feed = {}

                        if self.max_steps and self.max_steps <= global_step_val:
                            self.max_steps_reached = True

                        if global_step_val % FLAGS.display_step == 0:
                            global_step_val, loss_val, predictions_val, labels_val, labelRateError, decodedPr = \
                                sess.run([global_step, loss, predictions, labels, ler, decodedPrediction], feed)

                            feed[train_batch] = False
                            global_step_val_te, loss_val_te, predictions_val_te, label_val_te, labelRateError_te, decodedPr_te = \
                                sess.run([global_step, loss, predictions, labels, ler, decodedPrediction], feed)

                            examples_per_second = len(labels_val) / seconds_per_batch

                            if global_step_val % FLAGS.display_step_lme == 0:
                                lme = 0
                                eval_util.show_prediction(decodedPr_te, label_val_te, None, top_k=3)
                            else:
                                lme, lme_te = -1., -1.

                            logging.info("{}: training step {}".format(task_as_string(self.task), global_step_val)
                                         + " ler: {}".format(labelRateError) + "ler-te: {}".format(labelRateError_te)
                                         + " Loss: {}".format(loss_val) + " Loss-te: {}".format(loss_val_te))
                            sv.summary_writer.add_summary(
                                utils.makeSummary("model/labelRateError_train", labelRateError),
                                global_step_val
                            )
                            sv.summary_writer.add_summary(
                                utils.makeSummary("model/labelRateError_test", labelRateError_te)
                            )
                            sv.summary_writer.add_summary(
                                utils.makeSummary("model/lme_train", lme), global_step_val
                            )
                            sv.summary_writer.add_summary(
                                utils.makeSummary("model/lme_test", lme_te), global_step_val
                            )
                            sv.summary_writer.add_summary(
                                utils.makeSummary("model/loss_train", loss_val), global_step_val
                            )
                            sv.summary_writer.add_summary(
                                utils.makeSummary("model/loss_test", loss_val_te)
                            )
                            sv.summary_writer.add_summary(
                                utils.makeSummary("global_step/Examples/Second",
                                                  examples_per_second), global_step_val
                            )
                            sv.summary_writer.flush()

                            time_to_export = ((self.last_model_export_step == 0) or
                                              (global_step_val - self.last_model_export_step >= self.export_model_steps))

                            if time_to_export:
                                eval_util.show_prediction(decodedPr, labels_val)
                                self.export_model(global_step_val, sv.saver, sv.save_path, sess)
                                self.last_model_export_step = global_step_val

                    eval_util.show_prediction(decodedPr, labels_val)
                    self.export_model(global_step_val, sv.saver, sv.save_path, sess)

                except tf.errors.OutOfRangeError:
                    logging.info("{}: Done training -- epoch limit reached.",
                                task_as_string(self.task))
                logging.info("{}: Exited training loop.".format(task_as_string(self.task)))
                sv.stop()


    def export_model(self, global_step_val, saver, save_path, session):
        if global_step_val == self.last_model_export_step:
            return

        last_checkpoint = saver.save(session, save_path, global_step_val)

        model_dir = "{0}/export/step_{1}".format(self.train_dir, global_step_val)
        logging.info("{}: Exporting the model at step {} to {}".format(task_as_string(self.task), global_step_val, model_dir))

        self.model_exporter.export_model(
            model_dir=model_dir,
            global_step_val=global_step_val,
            last_checkpoint=last_checkpoint
        )




    def get_meta_filename(self, start_new_model, train_dir):
        if start_new_model:
            logging.info("{}: Flag 'start_new_model' is set. Building a new model.".format(task_as_string(self.task)))
            return None
        latest_checkpoint = tf.train.latest_checkpoint(train_dir)
        if not latest_checkpoint:
            logging.info("{}: No checkpoint file found. Building a new model.",
                         task_as_string(self.task))
            return None
        meta_filename = latest_checkpoint + ".meta"
        if not gfile.Exists(meta_filename):
            logging.info("{}: No meta graphh file found. Building a new model.",
                         task_as_string(self.task))
            return None
        else:
            return meta_filename
    def recover_model(self, meta_filename):
        logging.info(": Restoring from meta graph file {}",
                     task_as_string(self.task), meta_filename)
        return tf.train.import_meta_graph(meta_filename)

    def build_model(self, model, reader):
        label_loss_fn = find_class_by_name(FLAGS.label_loss, [losses])()
        optimizer_class = find_class_by_name(FLAGS.optimizer, [tf.train])

        build_graph(reader=reader,
                    model=model,
                    optimizer_class=optimizer_class,
                    clip_gradient_norm=FLAGS.clip_gradient_norm,
                    train_data_pattern=FLAGS.train_data_pattern,
                    label_loss_fn=label_loss_fn,
                    base_learning_rate=FLAGS.base_learning_rate,
                    learning_rate_decay=FLAGS.learning_rate_decay,
                    learning_rate_decay_examples=FLAGS.learning_rate_decay_examples,
                    regularization_penalty=FLAGS.regularization_penalty,
                    num_readers=FLAGS.num_readers,
                    batch_size=FLAGS.batch_size,
                    num_epochs=FLAGS.num_epochs)

        return tf.train.Saver(max_to_keep=0, keep_checkpoint_every_n_hours=0.25)

def get_reader():
    feature_names, feature_sizes = utils.getListOfFeatureNamesAndSizes(FLAGS.feature_names, FLAGS.feature_sizes)

    if FLAGS.slice_features:
        reader = readers.IAMAggregatedFeatureReader(
            feature_names=feature_names, feature_sizes=feature_sizes,
            height=FLAGS.height,
            width=FLAGS.width if FLAGS.stride == -1 else FLAGS.Bwidth,
            slices=FLAGS.slices,
            num_classes=FLAGS.vocabulary_size,
            stride=FLAGS.stride,
            input_channels=FLAGS.input_channels
        )
    else:
        raise NotImplementedError()
    return reader


def main(unused_args):
    env = json.loads(os.environ.get("TF_CONFIG", "{}"))

    task_data = env.get("task", None) or {"type": "aster", "index": 0}
    task = type("TaskSpec", (object,), task_data)

    logging.set_verbosity(tf.logging.INFO)
    logging.info("{}: Tensorflow version: {}".format(task_as_string(task), tf.__version__))

    model = models.MDLSTMCTCModel()
    reader = get_reader()

    model_exporter = export_model.ModelExporter(
        slice_features=FLAGS.slice_features,
        model=model,
        reader=reader
    )

    Trainer(task, FLAGS.train_dir, model, reader, model_exporter,
            FLAGS.log_device_placement, FLAGS.max_steps,
            FLAGS.export_model_steps).run(start_new_model=FLAGS.start_new_model)

if __name__ == "__main__":
    app.run()