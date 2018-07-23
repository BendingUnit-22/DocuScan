"""Contains a collection of utility functions for training and evaluating"""
from __future__ import absolute_import, division, print_function
import numpy as np
import tensorflow as tf
from tensorflow import logging
from tensorflow.python.ops import array_ops, variable_scope
from tensorflow import gfile

def _shape(tensor):
    return tensor.get_shape().as_list()

def task_as_string(task):
    return "/job:{}/task:{}".format(task.type, task.index)


def makeSummary(name, value):
    """Creates a tf.Summary prototype with given name and value"""
    summary = tf.Summary()
    val = summary.value.add()
    val.tag = str(name)
    val.simple_value = float(value)
    return summary

def getListOfFeatureNamesAndSizes(feature_names, feature_sizes):
    """Extract the list of feature names and the dimensionality of each
    feature from string of comma separated values

    Args:
        feature_names: string containing comma separated list of features names
        feature_sizes: string containing comma separated list of feature sizes

    Returns:
        List of the feature names and list of the dimensionality of each feature.
        elements in the first/second list are strings/integers
    """

    list_of_feature_names = [
        feature_names.strip() for feature_names in feature_names.split(',')
    ]
    list_of_feature_sizes = [
        int(feature_sizes) for feature_sizes in feature_sizes.split(',')
    ]
    if len(list_of_feature_names) != len(list_of_feature_sizes):
        logging.error("Length of feature names (={}) != Length of feature sizes (={})".format(
            len(list_of_feature_names), len(list_of_feature_sizes)
        ))
    return list_of_feature_names, list_of_feature_sizes

def get_blocks(images, kernel_size=(1, 1)):
    """Splits images into blocks
    Args:
        images: (num_images, height, width, channels) tensor
        kernel_size: A list of length 2 holding the window shape

    """
    with variable_scope.variable_scope("image_subsampling"):
        batch_size, height, width, channels = _shape(images)

        if height % kernel_size[0] != 0:
            offset = array_ops.zeros([batch_size,
                                      kernel_size[0] - (height % kernel_size[0]),
                                      width,
                                      channels])
            images = array_ops.concat([images, offset], 1)
            batch_size, height, width, channels = _shape(images)

        if width % kernel_size[1] != 0:
            offset = array_ops.zeros([batch_size,
                                      height,
                                      kernel_size[1] - (width % kernel_size[1]),
                                      channels])
            images = array_ops.concat([images, offset], 2)
            batch_size, height, width, channels = _shape(images)
        new_h, new_w = int(height / kernel_size[0]), int(width / kernel_size[1])
        features = kernel_size[0]*kernel_size[1]*channels

        lines = array_ops.split(images, new_h, axis=1)
        line_blocks = []
        for line in lines:
            line = array_ops.transpose(line, [0, 2, 3, 1])
            line = array_ops.reshape(line, [batch_size, new_w, features])
            line_blocks.append(line)
        return array_ops.stack(line_blocks, axis=1)
