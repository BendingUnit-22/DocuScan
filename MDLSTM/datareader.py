"""Provides a developer frontend for integrating datasets"""

import tensorflow as tf
import MDLSTM.utils

from tensorflow import logging

class BaseReader(object):
    """Inherit from this class when implementing new readers"""

    def prepare_reader(self, unused_filename_queue):
        """Create a thread for generating prediction and label tensors"""
        raise NotImplementedError()

class IAMAggregatedFeatureReader(BaseReader):
    def __init__(self,
                 num_classes=29,
                 feature_sizes=[36],
                 feature_names=["imageInput"],
                 height=36,
                 width=100,
                 slices=12,
                 stride=-1,
                 input_channels=1):
        assert len(feature_names) == len(feature_sizes), \
        "length of feature_names (={}) != length of feature_sizes (={})".format(len(feature_names), len(feature_sizes))

        self.num_classes = num_classes
        self.feature_sizes = feature_sizes
        self.feature_names = feature_names
        self.height, self.width = height, width
        self.slices = slices
        self.input_channels = input_channels
        self.stride = stride

    def prepare_reader(self, filename_queue, batch_size=50):
        reader = tf.TFRecordReader()
        _, serialized_examples = reader.read_up_to(filename_queue, batch_size)

        tf.add_to_collection("serialized_examples", serialized_examples)
        return self.prepare_serialized_examples(serialized_examples)

    def prepare_serialized_examples(self, serialized_examples):
        num_features = len(self.feature_names)
        assert num_features > 0, "self.feature_names is empty!"
        assert len(self.feature_names) == len(self.feature_sizes), "lengths of feature names and sizes don't match."

        d = self.height * self.slices * self.width * self.input_channels if self.stride == -1 \
            else self.height*self.width*self.input_channels
        if self.width == 1:
            d = self.height * self.slices * self.width * self.input_channels
        print(d, "*"*20, self.height, self.width, self.input_channels)
        feature_map = {'seq_len': tf.FixedLenFeature([1], tf.int64),
                       'target': tf.VarLenFeature(tf.int64),
                       'imageInput': tf.FixedLenFeature([d], tf.float32)}

        features = tf.parse_example(serialized_examples, features=feature_map)

        imageInput = features['imageInput']
        seq_len = features['seq_len']
        target = features['target']

        return imageInput, seq_len, target

