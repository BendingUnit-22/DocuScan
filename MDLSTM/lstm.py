from __future__ import absolute_import, division, print_function

from MDLSTM.utils import _shape, get_blocks
import tensorflow as tf
from six.moves import xrange
from tensorflow.contrib.framework.python.ops import variables
from tensorflow.contrib.rnn.python.ops.core_rnn_cell import rnn_cell_impl
from tensorflow.python.framework import constant_op
from tensorflow.python.ops import rnn_cell_impl, array_ops, math_ops, nn_ops, random_ops, rnn, variable_scope



def ndlstm_base_unrolled(inputs, noutput, scope=None, reverse=False):
    with variable_scope.variable_scope(scope, "LSTM_Seq_Unrolled", [inputs]):
        length, batch_size, _ = _shape(inputs)
        lstm_cell = rnn_cell_impl.BasicLSTMCell(noutput, state_is_tuple=False)
        state = array_ops.zeros([batch_size, lstm_cell.state_size])
        output_u = []
        inputs_u = array_ops.unstack(inputs)
        if reverse:
            inputs_u = list(reversed(inputs_u))
        for i in xrange(length):
            if i > 0:
                variable_scope.get_variable_scope().reuse_variables()
            output, state = lstm_cell(inputs_u[i], state)
            output_u += [output]
        if reverse:
            output_u = list(reversed(output_u))
        outputs = array_ops.stack(output_u)
        return outputs


def ndlstm_base_dynamic(inputs, noutputs, scope=None, reverse=False):
    with variable_scope.variable_scope(scope, "Sequence_LSTM", [inputs]):
        _, batch_size, _ = _shape(inputs)
        lstm_cell = rnn_cell_impl.BasicLSTMCell(noutputs, state_is_tuple=True)
        lstm_cell.zero_state(batch_size, tf.float32)
        sequence_length = int(inputs.get_shape()[0])
        sequence_lengths = math_ops.to_int64(array_ops.fill([batch_size], sequence_length))
        if reverse:
            inputs = array_ops.reverse_v2(inputs, [0])
        outputs, _ = rnn.dynamic_rnn(lstm_cell, inputs, sequence_lengths, dtype=tf.float32, time_major=True)
        if reverse:
            outputs = array_ops.reverse_v2(outputs, [0])
        return outputs

def ndlstm_base(inputs, noutputs, scope=None, reverse=False, dynamic=True):
    if dynamic:
        return ndlstm_base_dynamic(inputs, noutputs, scope=scope, reverse=reverse)
    else:
        return ndlstm_base_unrolled(inputs, noutputs, scope=scope, reverse=reverse)

def sequence_to_final(inputs, noutputs, scope=None, name=None, reverse=False):
    """Run an LSTM across all steps and return only the final state.

    Args:
        inputs: (seq_len, batch_size, depth) tensor
        noutputs: size of the output vector
        scope: optional scope name
        name: optional output tensor name
        reverse: switch to run in reverse

    Returns:
        batch of size (batch_size, noutputs)
    """
    with variable_scope.variable_scope(scope, "Sequence_to_Final", [inputs]):
        seq_length, batch_size, _ = _shape(inputs)
        lstm = rnn_cell_impl.BasicLSTMCell(noutputs, state_is_tuple=False)
        state = array_ops.zeros([batch_size, lstm.state_size])
        inputs_u = array_ops.unstack(inputs)
        if reverse:
            inputs_u = list(reversed(inputs_u))

        for i in xrange(seq_length):
            if i > 0:
                variable_scope.get_variable_scope().reuse_variables()
            output, state = lstm(inputs_u[i], state)
        outputs = array_ops.reshape(output, [batch_size, noutputs], name=name)
        return outputs


def sequence_softmax(inputs, noutputs, scope=None, name=None, linear_name=None):
    """Run a softmax layer over all time_steps of an input sequence

    Args:
        inputs: (seq_length, batch_size, depth) tensor
        noutputs: output_depth
        scope: optional scope name
        name: optional name for output tensor
        linear_name: optional name for linear (pre-softmax) output

    Returns:
        A tensor of size (seq_length, batch_size, noutputs)
    """
    seq_length, _, ninputs = _shape(inputs)
    inputs_u = array_ops.unstack(inputs)
    outputs_u = []
    with variable_scope.variable_scope(scope, "Sequential_Softmax", [inputs]):
        initial_w = random_ops.truncated_normal([0 + ninputs, noutputs], stddev=0.1)
        initial_b = constant_op.constant(0.1, shape=[noutputs])
        w = variables.model_variable("weights", initializer=initial_w)
        b = variables.model_variable("biases", initializer=initial_b)
        for i in xrange(seq_length):
            with variable_scope.variable_scope(scope, "Sequence_Softmax_Step", [inputs_u[i]]):
                linear = nn_ops.xw_plus_b_v1(inputs_u[i], w, b, name=linear_name)
                output = nn_ops.softmax(linear)
                outputs_u += [output]
        outputs = array_ops.stack(outputs_u, name=name)
    return outputs


def images_to_sequence(tensor):
    batch_size, h, w, channels = _shape(tensor)
    transposed = array_ops.transpose(tensor, [2, 0, 1, 3])
    return array_ops.reshape(transposed, [w, batch_size*h, channels])

def sequence_to_images(tensor, batch_size):
    w, seq_length, channels = _shape(tensor)
    h = seq_length // batch_size
    reshaped = array_ops.reshape(tensor, [w, batch_size, h, channels])
    return array_ops.transpose(reshaped, [1, 2, 0, 3])


def horizontal_lstm(images, num_filters_out, scope=None):
    with variable_scope.variable_scope(scope, "Horizontal_LSTM", [images]):
        batch_size, _, _, _ = _shape(images)
        sequence = images_to_sequence(images)
        with variable_scope.variable_scope("lr"):
            hidden_sequence_lr = ndlstm_base(sequence, num_filters_out//2)
        with variable_scope.variable_scope("rl"):
            hidden_sequence_rl = ndlstm_base(sequence, num_filters_out - num_filters_out//2, reverse=True)

        output_sequence = array_ops.concat([hidden_sequence_lr, hidden_sequence_rl], 2)
        output = sequence_to_images(output_sequence, batch_size)
    return output

def separable_lstm(images, num_filters_out, kernel_size=None, nhidden=None, scope=None):
    with variable_scope.variable_scope(scope, "Separable_LSTM", [images]):
        if nhidden is None:
            nhidden = num_filters_out
        if kernel_size is not None:
            images = get_blocks(images, kernel_size)
        with variable_scope.variable_scope("horizontal_pass"):
            hidden = horizontal_lstm(images, nhidden)
        with variable_scope.variable_scope("vertical_pass"):
            transposed = array_ops.transpose(hidden, [0, 2, 1, 3])
            output_transposed = horizontal_lstm(transposed, num_filters_out)
        output = array_ops.transpose(output_transposed, [0, 2, 1, 3])
    return output

def reduce_to_sequence(images, num_filters_out, scope=None):
    """Reduce an image to a sequence by scanning an LSTM over it vertically

    Args:
        images: (batch_size, height, width, channels)
        num_filters_out: output layer depth
        scope: optional scope name

    Return:
        A (width, batch_size, num_filters_out) sequence

    """
    with variable_scope.variable_scope(scope, "Reduce_to_Sequence", [images]):
        batch_size, h, w, channels = _shape(images)
        transposed = array_ops.transpose(images, [1, 0, 2, 3])
        reshaped = array_ops.reshape(transposed,
                                     [h, batch_size*w, channels])
        reduced = sequence_to_final(reshaped, num_filters_out)
        output = array_ops.reshape(reduced, [batch_size, w, num_filters_out])
        return output


def reduce_to_final(images, num_filters_out, nhidden=None, scope=None):
    """ Reduce an image to afinal state by running two lstms

    Args:
        images: (batch_size, height, width, channels) tensor
        num_filters_out: output layer depth
        nhidden: hidden layer depth (defaults to num_filters_out)
        scope: optional scope name

    Return:
        A (batch_size, num_filters_out) tensor
    """
    with variable_scope.variable_scope(scope, "Reduce_to_Final", [images]):
        nhidden = nhidden or num_filters_out
        batch_size, h, w, channels = _shape(images)
        transposed = array_ops.transpose(images, [1, 0, 2, 3])
        reshaped = array_ops.reshape(transposed, [h, batch_size*w, channels])
        with variable_scope.variable_scope("reduce1"):
            reduced = sequence_to_final(reshaped, nhidden)
            transposed_hidden = array_ops.reshape(reduced, [batch_size, w, nhidden])
            hidden = array_ops.transpose(transposed_hidden, [1, 0, 2])
        with variable_scope.variable_scope("reduce2"):
            output = sequence_to_final(hidden, num_filters_out)
        return output
