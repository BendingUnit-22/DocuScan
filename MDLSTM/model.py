from __future__ import absolute_import, division, print_function
from tensorflow.python.ops import array_ops, variable_scope
import math
import tensorflow as tf
from tensorflow import flags
from MDLSTM import utils, lstm
import numpy as np
import tensorflow.contrib.slim as slim
FLAGS = flags.FLAGS

class BaseModel(object):
    """Inherit from this when implementing Models"""

    def create_model(self, *params, **kwargs):
        raise NotImplementedError()


class MDLSTMCTCModel(BaseModel):

    def create_model(self, model_input, seq_len, vocab_size, target=None, is_training=True, keep_prob= 1.):
        imageInputs1 = tf.cast(model_input, tf.float32)
        seq_lens = tf.cast(seq_len, tf.int32)
        seq_lens1 = tf.reshape(seq_lens, [FLAGS.batch_size])
        self.keep_prob = keep_prob
        self.train_b = is_training

        imageInputs2 = tf.reshape(imageInputs1, [FLAGS.batch_size, FLAGS.height, FLAGS.Bwidth, FLAGS.input_channels])

        batch_norm_params = {'is_training': is_training, 'decay': 0.9, 'updates_collections': None}
        with slim.arg_scope([slim.conv2d, slim.fully_connected],
                            normalizer_fn=slim.batch_norm,
                            normalizer_params=batch_norm_params):
            x = imageInputs2
            net = slim.conv2d(x, 16, [5, 5], scope='conv1')
            net = slim.max_pool2d(net, [2, 2], scope='pool1')
            net = lstm.separable_lstm(net, 2, kernel_size=(4, 3), scope='lstm2d_1')
            net = slim.fully_connected(net, 6, activation_fn=tf.nn.tanh)
            #net = slim.conv2d(net, 64, [5, 5], scope='conv2')
            net = slim.max_pool2d(net, [2, 2], scope='pool2')
            net = lstm.separable_lstm(net, 124, kernel_size=None, scope='lstm2d_2')

        shape = utils._shape(net)
        batch_size = shape[0]
        # should be (batch_size, h, w, channels)
        outputs = tf.transpose(net, [2, 0, 1, 3])
        outputs = tf.reshape(outputs, [-1, shape[1]*shape[3]])

        with tf.name_scope('Train'):
            with tf.variable_scope('ctc_loss_1') as scope:
                myInitializer = tf.truncated_normal_initializer(mean=0., stddev=0.075, seed=None, dtype=tf.float32)

                W = tf.get_variable('w', [shape[1]*shape[3], 200], initializer=myInitializer)
                # zero initialization on biases
                b = tf.get_variable('b', shape=[200], initializer=myInitializer)

                W1 = tf.get_variable('w1', [200, vocab_size], initializer=myInitializer)
                # zero initialization
                b1 = tf.get_variable('b1', [vocab_size], initializer=myInitializer)
            tf.summary.histogram('histogram-b-ctc', b)
            tf.summary.histogram('histogram-w-ctc', W)

        logits = tf.matmul(outputs, W) + b
        logits = slim.dropout(logits, is_training=is_training, scope='dropout')
        logits = tf.matmul(logits, W1) + b1

        # reshape back to original shape
        logits = tf.reshape(logits, [-1, batch_size, vocab_size])
        return {"predictions": logits}