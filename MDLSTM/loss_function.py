import tensorflow as tf
try:
    from tensorflow.python.ops import ctc_ops
except ImportError:
    from tensorflow.contrib.ctc import ctc_ops

class BaseLoss(object):
    def calculate_loss(self, unused_predictions, unused_labels, **unused_params):
        raise NotImplementedError()

class CTCLoss(BaseLoss):
    def calculate_loss(self, logits, targets, seq_len, **unused_params):
        with tf.name_scope('CTC-loss'):
            loss = tf.nn.ctc_loss(targets, logits, seq_len)
            cost = tf.reduce_mean(loss)

        return cost

class CTCDecoder(object):
    def __init__(self, ctc_decoder='beam_search'):
        self.ctc_decoder = ctc_decoder

    def decode(self, predictions, seq_len, k):
        if self.ctc_decoder == 'greedy':
            decoded, log_prob = ctc_ops.ctc_greedy_decoder(predictions, seq_len)
        elif self.ctc_decoder == 'beam_search':
            decoded, log_prob = ctc_ops.ctc_beam_search_decoder(predictions, seq_len, top_paths=k)
        else:
            raise Exception("model type not supported: {}".format(self.ctc_decoder))

        return decoded

    def labelRateError(self, decoded, target):
        return tf.reduce_mean(tf.edit_distance(tf.cast(decoded[0], tf.int32), target))

    def useVocabulary(self, target):
        l = []
        for i in self.decoded:
            l.append(tf.edit_distance(tf.cast(i, tf.int32), target))
        return tf.stack(l, 0)