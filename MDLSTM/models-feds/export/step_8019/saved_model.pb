��,
�/�/
:
Add
x"T
y"T
z"T"
Ttype:
2	
h
All	
input

reduction_indices"Tidx

output
"
	keep_dimsbool( "
Tidxtype0:
2	
P
Assert
	condition
	
data2T"
T
list(type)(0"
	summarizeint�
x
Assign
ref"T�

value"T

output_ref"T�"	
Ttype"
validate_shapebool("
use_lockingbool(�
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
�
Conv2D

input"T
filter"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

y
Enter	
data"T
output"T"	
Ttype"

frame_namestring"
is_constantbool( "
parallel_iterationsint

B
Equal
x"T
y"T
z
"
Ttype:
2	
�
)
Exit	
data"T
output"T"	
Ttype
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
�
FusedBatchNorm
x"T

scale"T
offset"T	
mean"T
variance"T
y"T

batch_mean"T
batch_variance"T
reserve_space_1"T
reserve_space_2"T"
Ttype:
2"
epsilonfloat%��8"
data_formatstringNHWC"
is_trainingbool(
B
GreaterEqual
x"T
y"T
z
"
Ttype:
2	
V
HistogramSummary
tag
values"T
summary"
Ttype0:
2	
.
Identity

input"T
output"T"	
Ttype
:
Less
x"T
y"T
z
"
Ttype:
2	
$

LogicalAnd
x

y

z
�
!
LoopCond	
input


output

p
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
	2
�
Max

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
�
MaxPool

input"T
output"T"
Ttype0:
2	"
ksize	list(int)(0"
strides	list(int)(0""
paddingstring:
SAMEVALID":
data_formatstringNHWC:
NHWCNCHWNCHW_VECT_C
;
Maximum
x"T
y"T
z"T"
Ttype:

2	�
N
Merge
inputs"T*N
output"T
value_index"	
Ttype"
Nint(0
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(�
�
Min

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
;
Minimum
x"T
y"T
z"T"
Ttype:

2	�
=
Mul
x"T
y"T
z"T"
Ttype:
2	�
2
NextIteration	
data"T
output"T"	
Ttype

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
�
ParseExample

serialized	
names
sparse_keys*Nsparse

dense_keys*Ndense
dense_defaults2Tdense
sparse_indices	*Nsparse
sparse_values2sparse_types
sparse_shapes	*Nsparse
dense_values2Tdense"
Nsparseint("
Ndenseint("%
sparse_types
list(type)(:
2	"
Tdense
list(type)(:
2	"
dense_shapeslist(shape)(
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	�
a
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:	
2	
D
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
l
	ReverseV2
tensor"T
axis"Tidx
output"T"
Tidxtype0:
2	"
Ttype:
2	

l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
[
Split
	split_dim

value"T
output"T*	num_split"
	num_splitint(0"	
Ttype
�
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	
M
Switch	
data"T
pred

output_false"T
output_true"T"	
Ttype
-
Tanh
x"T
y"T"
Ttype:

2
{
TensorArrayGatherV3

handle
indices
flow_in
value"dtype"
dtypetype"
element_shapeshape:�
Y
TensorArrayReadV3

handle	
index
flow_in
value"dtype"
dtypetype�
d
TensorArrayScatterV3

handle
indices

value"T
flow_in
flow_out"	
Ttype�
9
TensorArraySizeV3

handle
flow_in
size�
�
TensorArrayV3
size

handle
flow"
dtypetype"
element_shapeshape:"
dynamic_sizebool( "
clear_after_readbool("$
identical_element_shapesbool( "
tensor_array_namestring �
`
TensorArrayWriteV3

handle	
index

value"T
flow_in
flow_out"	
Ttype�
P
	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
2	
�
TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	�
s

VariableV2
ref"dtype�"
shapeshape"
dtypetype"
	containerstring "
shared_namestring �"serve*1.7.02v1.7.0-3-g024aecf414��%
f
PlaceholderPlaceholder*
dtype0*#
_output_shapes
:���������*
shape:���������
U
ParseExample/ConstConst*
valueB *
dtype0*
_output_shapes
: 
W
ParseExample/Const_1Const*
valueB	 *
dtype0	*
_output_shapes
: 
b
ParseExample/ParseExample/namesConst*
valueB *
dtype0*
_output_shapes
: 
n
'ParseExample/ParseExample/sparse_keys_0Const*
valueB Btarget*
dtype0*
_output_shapes
: 
q
&ParseExample/ParseExample/dense_keys_0Const*
valueB B
imageInput*
dtype0*
_output_shapes
: 
n
&ParseExample/ParseExample/dense_keys_1Const*
valueB Bseq_len*
dtype0*
_output_shapes
: 
�
ParseExample/ParseExampleParseExamplePlaceholderParseExample/ParseExample/names'ParseExample/ParseExample/sparse_keys_0&ParseExample/ParseExample/dense_keys_0&ParseExample/ParseExample/dense_keys_1ParseExample/ConstParseExample/Const_1*
Tdense
2	*
Ndense*c
_output_shapesQ
O:���������:���������::����������D:���������*
Nsparse*
dense_shapes
:�D:*
sparse_types
2	
j
CastCastParseExample/ParseExample:4*

DstT0*'
_output_shapes
:���������*

SrcT0	
h
Cast_1CastParseExample/ParseExample:1*

SrcT0	*

DstT0*#
_output_shapes
:���������
`
ShapeShapeParseExample/ParseExample:3*
T0*
out_type0*
_output_shapes
:
]
strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
_
strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
_
strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
strided_sliceStridedSliceShapestrided_slice/stackstrided_slice/stack_1strided_slice/stack_2*
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
^
Reshape/shapePackstrided_slice*
T0*

axis *
N*
_output_shapes
:
c
ReshapeReshapeCastReshape/shape*
T0*
Tshape0*#
_output_shapes
:���������
]
model/Reshape/shapeConst*
_output_shapes
:*
valueB:#*
dtype0
i
model/ReshapeReshapeReshapemodel/Reshape/shape*
_output_shapes
:#*
T0*
Tshape0
n
model/Reshape_1/shapeConst*%
valueB"#      ^     *
dtype0*
_output_shapes
:
�
model/Reshape_1ReshapeParseExample/ParseExample:3model/Reshape_1/shape*
T0*
Tshape0*'
_output_shapes
:#�
�
.conv1/weights/Initializer/random_uniform/shapeConst* 
_class
loc:@conv1/weights*%
valueB"            *
dtype0*
_output_shapes
:
�
,conv1/weights/Initializer/random_uniform/minConst*
_output_shapes
: * 
_class
loc:@conv1/weights*
valueB
 *�V�*
dtype0
�
,conv1/weights/Initializer/random_uniform/maxConst* 
_class
loc:@conv1/weights*
valueB
 *�V�=*
dtype0*
_output_shapes
: 
�
6conv1/weights/Initializer/random_uniform/RandomUniformRandomUniform.conv1/weights/Initializer/random_uniform/shape*
seed2 *
dtype0*&
_output_shapes
:*

seed *
T0* 
_class
loc:@conv1/weights
�
,conv1/weights/Initializer/random_uniform/subSub,conv1/weights/Initializer/random_uniform/max,conv1/weights/Initializer/random_uniform/min*
T0* 
_class
loc:@conv1/weights*
_output_shapes
: 
�
,conv1/weights/Initializer/random_uniform/mulMul6conv1/weights/Initializer/random_uniform/RandomUniform,conv1/weights/Initializer/random_uniform/sub* 
_class
loc:@conv1/weights*&
_output_shapes
:*
T0
�
(conv1/weights/Initializer/random_uniformAdd,conv1/weights/Initializer/random_uniform/mul,conv1/weights/Initializer/random_uniform/min*
T0* 
_class
loc:@conv1/weights*&
_output_shapes
:
�
conv1/weights
VariableV2*
shared_name * 
_class
loc:@conv1/weights*
	container *
shape:*
dtype0*&
_output_shapes
:
�
conv1/weights/AssignAssignconv1/weights(conv1/weights/Initializer/random_uniform*
use_locking(*
T0* 
_class
loc:@conv1/weights*
validate_shape(*&
_output_shapes
:
�
conv1/weights/readIdentityconv1/weights* 
_class
loc:@conv1/weights*&
_output_shapes
:*
T0
j
model/conv1/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
�
model/conv1/Conv2DConv2Dmodel/Reshape_1conv1/weights/read*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
paddingSAME*'
_output_shapes
:#�*
	dilations
*
T0
�
6conv1/BatchNorm/beta/Initializer/zeros/shape_as_tensorConst*'
_class
loc:@conv1/BatchNorm/beta*
valueB:*
dtype0*
_output_shapes
:
�
,conv1/BatchNorm/beta/Initializer/zeros/ConstConst*'
_class
loc:@conv1/BatchNorm/beta*
valueB
 *    *
dtype0*
_output_shapes
: 
�
&conv1/BatchNorm/beta/Initializer/zerosFill6conv1/BatchNorm/beta/Initializer/zeros/shape_as_tensor,conv1/BatchNorm/beta/Initializer/zeros/Const*
T0*'
_class
loc:@conv1/BatchNorm/beta*

index_type0*
_output_shapes
:
�
conv1/BatchNorm/beta
VariableV2*
shape:*
dtype0*
_output_shapes
:*
shared_name *'
_class
loc:@conv1/BatchNorm/beta*
	container 
�
conv1/BatchNorm/beta/AssignAssignconv1/BatchNorm/beta&conv1/BatchNorm/beta/Initializer/zeros*
T0*'
_class
loc:@conv1/BatchNorm/beta*
validate_shape(*
_output_shapes
:*
use_locking(
�
conv1/BatchNorm/beta/readIdentityconv1/BatchNorm/beta*
T0*'
_class
loc:@conv1/BatchNorm/beta*
_output_shapes
:
h
model/conv1/BatchNorm/ConstConst*
valueB*  �?*
dtype0*
_output_shapes
:
�
=conv1/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensorConst*
_output_shapes
:*.
_class$
" loc:@conv1/BatchNorm/moving_mean*
valueB:*
dtype0
�
3conv1/BatchNorm/moving_mean/Initializer/zeros/ConstConst*.
_class$
" loc:@conv1/BatchNorm/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
�
-conv1/BatchNorm/moving_mean/Initializer/zerosFill=conv1/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor3conv1/BatchNorm/moving_mean/Initializer/zeros/Const*.
_class$
" loc:@conv1/BatchNorm/moving_mean*

index_type0*
_output_shapes
:*
T0
�
conv1/BatchNorm/moving_mean
VariableV2*
shared_name *.
_class$
" loc:@conv1/BatchNorm/moving_mean*
	container *
shape:*
dtype0*
_output_shapes
:
�
"conv1/BatchNorm/moving_mean/AssignAssignconv1/BatchNorm/moving_mean-conv1/BatchNorm/moving_mean/Initializer/zeros*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*.
_class$
" loc:@conv1/BatchNorm/moving_mean
�
 conv1/BatchNorm/moving_mean/readIdentityconv1/BatchNorm/moving_mean*
T0*.
_class$
" loc:@conv1/BatchNorm/moving_mean*
_output_shapes
:
�
@conv1/BatchNorm/moving_variance/Initializer/ones/shape_as_tensorConst*2
_class(
&$loc:@conv1/BatchNorm/moving_variance*
valueB:*
dtype0*
_output_shapes
:
�
6conv1/BatchNorm/moving_variance/Initializer/ones/ConstConst*2
_class(
&$loc:@conv1/BatchNorm/moving_variance*
valueB
 *  �?*
dtype0*
_output_shapes
: 
�
0conv1/BatchNorm/moving_variance/Initializer/onesFill@conv1/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor6conv1/BatchNorm/moving_variance/Initializer/ones/Const*
T0*2
_class(
&$loc:@conv1/BatchNorm/moving_variance*

index_type0*
_output_shapes
:
�
conv1/BatchNorm/moving_variance
VariableV2*
shape:*
dtype0*
_output_shapes
:*
shared_name *2
_class(
&$loc:@conv1/BatchNorm/moving_variance*
	container 
�
&conv1/BatchNorm/moving_variance/AssignAssignconv1/BatchNorm/moving_variance0conv1/BatchNorm/moving_variance/Initializer/ones*
_output_shapes
:*
use_locking(*
T0*2
_class(
&$loc:@conv1/BatchNorm/moving_variance*
validate_shape(
�
$conv1/BatchNorm/moving_variance/readIdentityconv1/BatchNorm/moving_variance*
T0*2
_class(
&$loc:@conv1/BatchNorm/moving_variance*
_output_shapes
:
�
$model/conv1/BatchNorm/FusedBatchNormFusedBatchNormmodel/conv1/Conv2Dmodel/conv1/BatchNorm/Constconv1/BatchNorm/beta/read conv1/BatchNorm/moving_mean/read$conv1/BatchNorm/moving_variance/read*
epsilon%o�:*
T0*
data_formatNHWC*
is_training( *?
_output_shapes-
+:#�::::
p
model/conv1/ReluRelu$model/conv1/BatchNorm/FusedBatchNorm*'
_output_shapes
:#�*
T0
�
model/pool1/MaxPoolMaxPoolmodel/conv1/Relu*
paddingVALID*'
_output_shapes
:#�*
T0*
data_formatNHWC*
strides
*
ksize

�
6model/lstm2d_1/image_subsampling/zeros/shape_as_tensorConst*%
valueB"#            *
dtype0*
_output_shapes
:
q
,model/lstm2d_1/image_subsampling/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
&model/lstm2d_1/image_subsampling/zerosFill6model/lstm2d_1/image_subsampling/zeros/shape_as_tensor,model/lstm2d_1/image_subsampling/zeros/Const*
T0*

index_type0*&
_output_shapes
:#
n
,model/lstm2d_1/image_subsampling/concat/axisConst*
value	B :*
dtype0*
_output_shapes
: 
�
'model/lstm2d_1/image_subsampling/concatConcatV2model/pool1/MaxPool&model/lstm2d_1/image_subsampling/zeros,model/lstm2d_1/image_subsampling/concat/axis*
T0*
N*'
_output_shapes
:#�*

Tidx0
h
&model/lstm2d_1/image_subsampling/ConstConst*
value	B :*
dtype0*
_output_shapes
: 
r
0model/lstm2d_1/image_subsampling/split/split_dimConst*
value	B :*
dtype0*
_output_shapes
: 
�
&model/lstm2d_1/image_subsampling/splitSplit0model/lstm2d_1/image_subsampling/split/split_dim'model/lstm2d_1/image_subsampling/concat*
	num_split*M
_output_shapes;
9:#�:#�:#�*
T0
�
/model/lstm2d_1/image_subsampling/transpose/permConst*
_output_shapes
:*%
valueB"             *
dtype0
�
*model/lstm2d_1/image_subsampling/transpose	Transpose&model/lstm2d_1/image_subsampling/split/model/lstm2d_1/image_subsampling/transpose/perm*
T0*'
_output_shapes
:#�*
Tperm0
�
.model/lstm2d_1/image_subsampling/Reshape/shapeConst*!
valueB"#   ;   �   *
dtype0*
_output_shapes
:
�
(model/lstm2d_1/image_subsampling/ReshapeReshape*model/lstm2d_1/image_subsampling/transpose.model/lstm2d_1/image_subsampling/Reshape/shape*
T0*
Tshape0*#
_output_shapes
:#;�
�
1model/lstm2d_1/image_subsampling/transpose_1/permConst*%
valueB"             *
dtype0*
_output_shapes
:
�
,model/lstm2d_1/image_subsampling/transpose_1	Transpose(model/lstm2d_1/image_subsampling/split:11model/lstm2d_1/image_subsampling/transpose_1/perm*
T0*'
_output_shapes
:#�*
Tperm0
�
0model/lstm2d_1/image_subsampling/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*!
valueB"#   ;   �   
�
*model/lstm2d_1/image_subsampling/Reshape_1Reshape,model/lstm2d_1/image_subsampling/transpose_10model/lstm2d_1/image_subsampling/Reshape_1/shape*
T0*
Tshape0*#
_output_shapes
:#;�
�
1model/lstm2d_1/image_subsampling/transpose_2/permConst*%
valueB"             *
dtype0*
_output_shapes
:
�
,model/lstm2d_1/image_subsampling/transpose_2	Transpose(model/lstm2d_1/image_subsampling/split:21model/lstm2d_1/image_subsampling/transpose_2/perm*
T0*'
_output_shapes
:#�*
Tperm0
�
0model/lstm2d_1/image_subsampling/Reshape_2/shapeConst*!
valueB"#   ;   �   *
dtype0*
_output_shapes
:
�
*model/lstm2d_1/image_subsampling/Reshape_2Reshape,model/lstm2d_1/image_subsampling/transpose_20model/lstm2d_1/image_subsampling/Reshape_2/shape*#
_output_shapes
:#;�*
T0*
Tshape0
�
&model/lstm2d_1/image_subsampling/stackPack(model/lstm2d_1/image_subsampling/Reshape*model/lstm2d_1/image_subsampling/Reshape_1*model/lstm2d_1/image_subsampling/Reshape_2*
N*'
_output_shapes
:#;�*
T0*

axis
�
=model/lstm2d_1/horizontal_pass/Horizontal_LSTM/transpose/permConst*%
valueB"             *
dtype0*
_output_shapes
:
�
8model/lstm2d_1/horizontal_pass/Horizontal_LSTM/transpose	Transpose&model/lstm2d_1/image_subsampling/stack=model/lstm2d_1/horizontal_pass/Horizontal_LSTM/transpose/perm*
T0*'
_output_shapes
:;#�*
Tperm0
�
<model/lstm2d_1/horizontal_pass/Horizontal_LSTM/Reshape/shapeConst*!
valueB";   i   �   *
dtype0*
_output_shapes
:
�
6model/lstm2d_1/horizontal_pass/Horizontal_LSTM/ReshapeReshape8model/lstm2d_1/horizontal_pass/Horizontal_LSTM/transpose<model/lstm2d_1/horizontal_pass/Horizontal_LSTM/Reshape/shape*
T0*
Tshape0*#
_output_shapes
:;i�
�
\model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/ConstConst*
valueB:i*
dtype0*
_output_shapes
:
�
^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_1Const*
valueB:*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
]model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concatConcatV2\model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_1bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat/axis*

Tidx0*
T0*
N*
_output_shapes
:
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
\model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zerosFill]model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concatbmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zeros/Const*
T0*

index_type0*
_output_shapes

:i
�
^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_2Const*
dtype0*
_output_shapes
:*
valueB:i
�
^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_3Const*
_output_shapes
:*
valueB:*
dtype0
�
^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_4Const*
valueB:i*
dtype0*
_output_shapes
:
�
^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_5Const*
valueB:*
dtype0*
_output_shapes
:
�
dmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat_1ConcatV2^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_4^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_5dmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat_1/axis*
N*
_output_shapes
:*

Tidx0*
T0
�
dmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1Fill_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat_1dmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1/Const*
T0*

index_type0*
_output_shapes

:i
�
^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_6Const*
valueB:i*
dtype0*
_output_shapes
:
�
^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_7Const*
dtype0*
_output_shapes
:*
valueB:
�
Imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/Fill/dimsConst*
valueB:i*
dtype0*
_output_shapes
:
�
Jmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/Fill/valueConst*
dtype0*
_output_shapes
: *
value	B :;
�
Dmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/FillFillImodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/Fill/dimsJmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/Fill/value*
T0*

index_type0*
_output_shapes
:i
�
Gmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/ToInt64CastDmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/Fill*

SrcT0*

DstT0	*
_output_shapes
:i
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/ToInt32CastGmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/ToInt64*

SrcT0	*

DstT0*
_output_shapes
:i
�
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/sequence_lengthIdentityKmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/ToInt32*
T0*
_output_shapes
:i
�
`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/ConstConst*
dtype0*
_output_shapes
:*
valueB:i
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_1Const*
valueB:*
dtype0*
_output_shapes
:
�
fmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concatConcatV2`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Constbmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_1fmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat/axis*
N*
_output_shapes
:*

Tidx0*
T0
�
fmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros/ConstConst*
_output_shapes
: *
valueB
 *    *
dtype0
�
`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zerosFillamodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concatfmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros/Const*
T0*

index_type0*
_output_shapes

:i
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_2Const*
valueB:i*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_3Const*
valueB:*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_4Const*
valueB:i*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_5Const*
dtype0*
_output_shapes
:*
valueB:
�
hmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1ConcatV2bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_4bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_5hmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1/axis*
T0*
N*
_output_shapes
:*

Tidx0
�
hmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1Fillcmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1hmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1/Const*
_output_shapes

:i*
T0*

index_type0
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_6Const*
dtype0*
_output_shapes
:*
valueB:i
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_7Const*
valueB:*
dtype0*
_output_shapes
:
�
Imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/ShapeConst*
dtype0*
_output_shapes
:*
valueB:i
�
Imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/stackConst*
valueB:i*
dtype0*
_output_shapes
:
�
Imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/EqualEqualImodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/ShapeImodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/stack*
T0*
_output_shapes
:
�
Imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/ConstConst*
valueB: *
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/AllAllImodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/EqualImodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const*
_output_shapes
: *
	keep_dims( *

Tidx0
�
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/ConstConst*
dtype0*
_output_shapes
: *�
value{By BsExpected shape for Tensor model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/sequence_length:0 is 
�
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Const_1Const*!
valueB B but saw shape: *
dtype0*
_output_shapes
: 
�
Xmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Assert/data_0Const*�
value{By BsExpected shape for Tensor model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/sequence_length:0 is *
dtype0*
_output_shapes
: 
�
Xmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Assert/data_2Const*!
valueB B but saw shape: *
dtype0*
_output_shapes
: 
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/AssertAssertGmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/AllXmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Assert/data_0Imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/stackXmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Assert/data_2Imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Shape*
T
2*
	summarize
�
Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLenIdentitySmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/sequence_lengthR^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Assert*
T0*
_output_shapes
:i
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Shape_1Const*!
valueB";   i   �   *
dtype0*
_output_shapes
:
�
Wmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
�
Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_sliceStridedSliceKmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Shape_1Wmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stackYmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stack_1Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_1Const*
valueB:i*
dtype0*
_output_shapes
:
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_2Const*
valueB:*
dtype0*
_output_shapes
:
�
Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
Jmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/concatConcatV2Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_1Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_2Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/concat/axis*
N*
_output_shapes
:*

Tidx0*
T0
�
Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
Imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zerosFillJmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/concatOmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zeros/Const*
T0*

index_type0*
_output_shapes

:i
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_3Const*
valueB: *
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/MinMinOmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLenKmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_3*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_4Const*
valueB: *
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/MaxMaxOmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLenKmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_4*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
�
Hmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/timeConst*
value	B : *
dtype0*
_output_shapes
: 
�
Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayTensorArrayV3Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice*o
tensor_array_nameZXmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/dynamic_rnn/output_0*
dtype0*
_output_shapes

:: *
element_shape
:i*
clear_after_read(*
dynamic_size( *
identical_element_shapes(
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1TensorArrayV3Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice*
element_shape:	i�*
clear_after_read(*
dynamic_size( *
identical_element_shapes(*n
tensor_array_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/dynamic_rnn/input_0*
dtype0*
_output_shapes

:: 
�
\model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/ShapeConst*!
valueB";   i   �   *
dtype0*
_output_shapes
:
�
jmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
lmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
lmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
dmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_sliceStridedSlice\model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/Shapejmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stacklmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_1lmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
�
\model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/rangeRangebmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/range/startdmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slicebmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/range/delta*#
_output_shapes
:���������*

Tidx0
�
~model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1\model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/range6model/lstm2d_1/horizontal_pass/Horizontal_LSTM/ReshapeSmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1:1*I
_class?
=;loc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/Reshape*
_output_shapes
: *
T0
�
Mmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Maximum/xConst*
value	B :*
dtype0*
_output_shapes
: 
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/MaximumMaximumMmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Maximum/xGmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Max*
T0*
_output_shapes
: 
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/MinimumMinimumQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_sliceKmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Maximum*
T0*
_output_shapes
: 
�
[model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/iteration_counterConst*
dtype0*
_output_shapes
: *
value	B : 
�
Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/EnterEnter[model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/iteration_counter*
T0*
is_constant( *
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_1EnterHmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/time*
T0*
is_constant( *
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_2EnterQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray:1*
T0*
is_constant( *
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_3Enter`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros*
T0*
is_constant( *
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes

:i
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_4Enterbmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1*
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes

:i*
T0*
is_constant( 
�
Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/MergeMergeOmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/EnterWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration*
T0*
N*
_output_shapes
: : 
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1MergeQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_1Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_1*
T0*
N*
_output_shapes
: : 
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_2MergeQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_2Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_2*
N*
_output_shapes
: : *
T0
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_3MergeQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_3Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_3*
T0*
N* 
_output_shapes
:i: 
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_4MergeQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_4Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_4*
T0*
N* 
_output_shapes
:i: 
�
Nmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LessLessOmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/MergeTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less/Enter*
T0*
_output_shapes
: 
�
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less/EnterEnterQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice*
T0*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1LessQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1/Enter*
T0*
_output_shapes
: 
�
Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1/EnterEnterKmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Minimum*
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: *
T0*
is_constant(
�
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LogicalAnd
LogicalAndNmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LessPmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1*
_output_shapes
: 
�
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCondLoopCondTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LogicalAnd*
_output_shapes
: 
�
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/SwitchSwitchOmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/MergeRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond*b
_classX
VTloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge*
_output_shapes
: : *
T0
�
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_1SwitchQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond*
T0*d
_classZ
XVloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1*
_output_shapes
: : 
�
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_2SwitchQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_2Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond*
_output_shapes
: : *
T0*d
_classZ
XVloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_2
�
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_3SwitchQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_3Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond*
T0*d
_classZ
XVloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_3*(
_output_shapes
:i:i
�
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_4SwitchQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_4Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond*
T0*d
_classZ
XVloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_4*(
_output_shapes
:i:i
�
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/IdentityIdentityRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch:1*
T0*
_output_shapes
: 
�
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1IdentityTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_1:1*
T0*
_output_shapes
: 
�
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_2IdentityTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_2:1*
T0*
_output_shapes
: 
�
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_3IdentityTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_3:1*
T0*
_output_shapes

:i
�
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_4IdentityTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_4:1*
T0*
_output_shapes

:i
�
Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add/yConstS^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
Mmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/addAddRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/IdentityOmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add/y*
T0*
_output_shapes
: 
�
[model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3TensorArrayReadV3amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/EnterTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1*
dtype0*
_output_shapes
:	i�
�
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/EnterEnterQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1*
T0*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:
�
cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1Enter~model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: *
T0
�
Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqualGreaterEqualTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1\model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqual/Enter*
_output_shapes
:i*
T0
�
\model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqual/EnterEnterOmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLen*
T0*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:i
�
ulstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shapeConst*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB"�      *
dtype0*
_output_shapes
:
�
slstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB
 *�2�
�
slstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/maxConst*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB
 *�2>*
dtype0*
_output_shapes
: 
�
}lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniformRandomUniformulstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shape*
dtype0*
_output_shapes
:	�*

seed *
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
seed2 
�
slstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/subSubslstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/maxslstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
_output_shapes
: 
�
slstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mulMul}lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniformslstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/sub*
_output_shapes
:	�*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
olstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniformAddslstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mulslstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
_output_shapes
:	�
�
Tlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel
VariableV2*
shared_name *g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
	container *
shape:	�*
dtype0*
_output_shapes
:	�
�
[lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignAssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelolstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform*
_output_shapes
:	�*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(
�
Ylstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/readIdentityTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
T0*
_output_shapes
:	�
�
tlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/shape_as_tensorConst*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
valueB:*
dtype0*
_output_shapes
:
�
jlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/ConstConst*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
valueB
 *    *
dtype0*
_output_shapes
: 
�
dlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zerosFilltlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/shape_as_tensorjlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/Const*
T0*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*

index_type0*
_output_shapes
:
�
Rlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias
VariableV2*
shape:*
dtype0*
_output_shapes
:*
shared_name *e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
	container 
�
Ylstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignAssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasdlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:
�
Wlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/readIdentityRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
T0*
_output_shapes
:
�
_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/ConstConstS^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
emodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axisConstS^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concatConcatV2[model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_4emodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axis*
N*
_output_shapes
:	i�*

Tidx0*
T0
�
`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMulMatMul`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concatfmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter*
transpose_a( *
_output_shapes

:i*
transpose_b( *
T0
�
fmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/EnterEnterYlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read*
T0*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:	�
�
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAddBiasAdd`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMulgmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter*
data_formatNHWC*
_output_shapes

:i*
T0
�
gmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/EnterEnterWlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/read*
T0*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:
�
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_1ConstS^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/splitSplit_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Constamodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd*
T0*
	num_split*<
_output_shapes*
(:i:i:i:i
�
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2ConstS^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
valueB
 *  �?*
dtype0*
_output_shapes
: 
�
]model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/AddAddamodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:2amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2*
_output_shapes

:i*
T0
�
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/SigmoidSigmoid]model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add*
_output_shapes

:i*
T0
�
]model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MulMulTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_3amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid*
_output_shapes

:i*
T0
�
cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1Sigmoid_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split*
T0*
_output_shapes

:i
�
^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/TanhTanhamodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:1*
T0*
_output_shapes

:i
�
_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1Mulcmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh*
T0*
_output_shapes

:i
�
_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1Add]model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1*
_output_shapes

:i*
T0
�
`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1Tanh_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*
T0*
_output_shapes

:i
�
cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2Sigmoidamodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:3*
_output_shapes

:i*
T0
�
_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2Mul`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2*
_output_shapes

:i*
T0
�
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/SelectSelectVmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqualVmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select/Enter_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes

:i*
T0*r
_classh
fdloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2
�
Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select/EnterEnterImodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zeros*
_output_shapes

:i*g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
T0*r
_classh
fdloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
parallel_iterations *
is_constant(
�
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_1SelectVmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqualTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_3_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*
T0*r
_classh
fdloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*
_output_shapes

:i
�
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_2SelectVmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqualTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_4_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*r
_classh
fdloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes

:i*
T0
�
mmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/SelectTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_2*
T0*r
_classh
fdloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes
: 
�
smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterOmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*
is_constant(*
_output_shapes
:*g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
T0*r
_classh
fdloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
parallel_iterations 
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1/yConstS^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1AddTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1/y*
T0*
_output_shapes
: 
�
Wmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIterationNextIterationMmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add*
_output_shapes
: *
T0
�
Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_1NextIterationOmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1*
T0*
_output_shapes
: 
�
Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_2NextIterationmmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
�
Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_3NextIterationRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_1*
T0*
_output_shapes

:i
�
Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_4NextIterationRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_2*
_output_shapes

:i*
T0
�
Nmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/ExitExitPmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch*
T0*
_output_shapes
: 
�
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_1ExitRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_1*
T0*
_output_shapes
: 
�
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_2ExitRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_2*
_output_shapes
: *
T0
�
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_3ExitRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_3*
_output_shapes

:i*
T0
�
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_4ExitRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_4*
T0*
_output_shapes

:i
�
fmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayPmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_2*b
_classX
VTloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*
_output_shapes
: 
�
`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/range/startConst*
_output_shapes
: *b
_classX
VTloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*
value	B : *
dtype0
�
`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/range/deltaConst*b
_classX
VTloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*
value	B :*
dtype0*
_output_shapes
: 
�
Zmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/rangeRange`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/range/startfmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/TensorArraySizeV3`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/range/delta*b
_classX
VTloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*#
_output_shapes
:���������*

Tidx0
�
hmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayZmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/rangePmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_2*
element_shape
:i*b
_classX
VTloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*
dtype0*"
_output_shapes
:;i
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_5Const*
valueB";   i   *
dtype0*
_output_shapes
:
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_6Const*
dtype0*
_output_shapes
:*
valueB:
�
\model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/ConstConst*
valueB:i*
dtype0*
_output_shapes
:
�
^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_1Const*
valueB:*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
�
]model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concatConcatV2\model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_1bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat/axis*
_output_shapes
:*

Tidx0*
T0*
N
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
\model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zerosFill]model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concatbmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zeros/Const*
T0*

index_type0*
_output_shapes

:i
�
^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_2Const*
_output_shapes
:*
valueB:i*
dtype0
�
^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_3Const*
valueB:*
dtype0*
_output_shapes
:
�
^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_4Const*
valueB:i*
dtype0*
_output_shapes
:
�
^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_5Const*
_output_shapes
:*
valueB:*
dtype0
�
dmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat_1ConcatV2^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_4^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_5dmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat_1/axis*
T0*
N*
_output_shapes
:*

Tidx0
�
dmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1Fill_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat_1dmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1/Const*
T0*

index_type0*
_output_shapes

:i
�
^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_6Const*
valueB:i*
dtype0*
_output_shapes
:
�
^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_7Const*
valueB:*
dtype0*
_output_shapes
:
�
Imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/Fill/dimsConst*
dtype0*
_output_shapes
:*
valueB:i
�
Jmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/Fill/valueConst*
value	B :;*
dtype0*
_output_shapes
: 
�
Dmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/FillFillImodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/Fill/dimsJmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/Fill/value*
T0*

index_type0*
_output_shapes
:i
�
Gmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ToInt64CastDmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/Fill*

DstT0	*
_output_shapes
:i*

SrcT0
�
Nmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2/axisConst*
valueB: *
dtype0*
_output_shapes
:
�
Imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2	ReverseV26model/lstm2d_1/horizontal_pass/Horizontal_LSTM/ReshapeNmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2/axis*
T0*#
_output_shapes
:;i�*

Tidx0
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/ToInt32CastGmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ToInt64*

SrcT0	*

DstT0*
_output_shapes
:i
�
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/sequence_lengthIdentityKmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/ToInt32*
_output_shapes
:i*
T0
�
`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/ConstConst*
_output_shapes
:*
valueB:i*
dtype0
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_1Const*
_output_shapes
:*
valueB:*
dtype0
�
fmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
�
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concatConcatV2`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Constbmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_1fmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat/axis*

Tidx0*
T0*
N*
_output_shapes
:
�
fmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zerosFillamodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concatfmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros/Const*
T0*

index_type0*
_output_shapes

:i
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_2Const*
valueB:i*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_3Const*
valueB:*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_4Const*
valueB:i*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_5Const*
valueB:*
dtype0*
_output_shapes
:
�
hmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1ConcatV2bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_4bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_5hmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1/axis*

Tidx0*
T0*
N*
_output_shapes
:
�
hmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1Fillcmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1hmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1/Const*
T0*

index_type0*
_output_shapes

:i
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_6Const*
dtype0*
_output_shapes
:*
valueB:i
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_7Const*
valueB:*
dtype0*
_output_shapes
:
�
Imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/ShapeConst*
valueB:i*
dtype0*
_output_shapes
:
�
Imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/stackConst*
_output_shapes
:*
valueB:i*
dtype0
�
Imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/EqualEqualImodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/ShapeImodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/stack*
_output_shapes
:*
T0
�
Imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/ConstConst*
valueB: *
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/AllAllImodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/EqualImodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const*
_output_shapes
: *
	keep_dims( *

Tidx0
�
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/ConstConst*�
value{By BsExpected shape for Tensor model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/sequence_length:0 is *
dtype0*
_output_shapes
: 
�
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Const_1Const*!
valueB B but saw shape: *
dtype0*
_output_shapes
: 
�
Xmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Assert/data_0Const*
_output_shapes
: *�
value{By BsExpected shape for Tensor model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/sequence_length:0 is *
dtype0
�
Xmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Assert/data_2Const*!
valueB B but saw shape: *
dtype0*
_output_shapes
: 
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/AssertAssertGmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/AllXmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Assert/data_0Imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/stackXmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Assert/data_2Imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Shape*
T
2*
	summarize
�
Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLenIdentitySmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/sequence_lengthR^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Assert*
T0*
_output_shapes
:i
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Shape_1Const*!
valueB";   i   �   *
dtype0*
_output_shapes
:
�
Wmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_sliceStridedSliceKmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Shape_1Wmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stackYmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stack_1Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_1Const*
valueB:i*
dtype0*
_output_shapes
:
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_2Const*
valueB:*
dtype0*
_output_shapes
:
�
Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
Jmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/concatConcatV2Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_1Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_2Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/concat/axis*
N*
_output_shapes
:*

Tidx0*
T0
�
Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
Imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zerosFillJmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/concatOmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zeros/Const*
T0*

index_type0*
_output_shapes

:i
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_3Const*
dtype0*
_output_shapes
:*
valueB: 
�
Gmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/MinMinOmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLenKmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_3*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_4Const*
valueB: *
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/MaxMaxOmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLenKmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_4*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
�
Hmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/timeConst*
value	B : *
dtype0*
_output_shapes
: 
�
Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayTensorArrayV3Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice*o
tensor_array_nameZXmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/dynamic_rnn/output_0*
dtype0*
_output_shapes

:: *
element_shape
:i*
dynamic_size( *
clear_after_read(*
identical_element_shapes(
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1TensorArrayV3Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice*
clear_after_read(*
dynamic_size( *
identical_element_shapes(*n
tensor_array_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/dynamic_rnn/input_0*
dtype0*
_output_shapes

:: *
element_shape:	i�
�
\model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/ShapeConst*!
valueB";   i   �   *
dtype0*
_output_shapes
:
�
jmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
lmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
lmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
dmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_sliceStridedSlice\model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/Shapejmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stacklmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_1lmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_2*
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask 
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
�
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/range/deltaConst*
_output_shapes
: *
value	B :*
dtype0
�
\model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/rangeRangebmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/range/startdmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slicebmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/range/delta*#
_output_shapes
:���������*

Tidx0
�
~model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1\model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/rangeImodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1:1*
_output_shapes
: *
T0*\
_classR
PNloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2
�
Mmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Maximum/xConst*
value	B :*
dtype0*
_output_shapes
: 
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/MaximumMaximumMmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Maximum/xGmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Max*
T0*
_output_shapes
: 
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/MinimumMinimumQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_sliceKmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Maximum*
T0*
_output_shapes
: 
�
[model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/iteration_counterConst*
value	B : *
dtype0*
_output_shapes
: 
�
Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/EnterEnter[model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/iteration_counter*
T0*
is_constant( *
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_1EnterHmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/time*
T0*
is_constant( *
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_2EnterQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray:1*
is_constant( *
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: *
T0
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_3Enter`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros*
T0*
is_constant( *
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes

:i
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_4Enterbmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1*
T0*
is_constant( *
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes

:i
�
Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/MergeMergeOmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/EnterWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration*
T0*
N*
_output_shapes
: : 
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1MergeQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_1Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_1*
N*
_output_shapes
: : *
T0
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_2MergeQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_2Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_2*
T0*
N*
_output_shapes
: : 
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_3MergeQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_3Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_3*
T0*
N* 
_output_shapes
:i: 
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_4MergeQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_4Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_4*
T0*
N* 
_output_shapes
:i: 
�
Nmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LessLessOmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/MergeTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less/Enter*
_output_shapes
: *
T0
�
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less/EnterEnterQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice*
T0*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1LessQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1/Enter*
_output_shapes
: *
T0
�
Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1/EnterEnterKmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Minimum*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: *
T0
�
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LogicalAnd
LogicalAndNmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LessPmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1*
_output_shapes
: 
�
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCondLoopCondTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LogicalAnd*
_output_shapes
: 
�
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/SwitchSwitchOmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/MergeRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond*b
_classX
VTloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge*
_output_shapes
: : *
T0
�
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_1SwitchQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond*
_output_shapes
: : *
T0*d
_classZ
XVloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1
�
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_2SwitchQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_2Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond*
T0*d
_classZ
XVloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_2*
_output_shapes
: : 
�
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_3SwitchQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_3Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond*
T0*d
_classZ
XVloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_3*(
_output_shapes
:i:i
�
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_4SwitchQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_4Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond*
T0*d
_classZ
XVloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_4*(
_output_shapes
:i:i
�
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/IdentityIdentityRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch:1*
T0*
_output_shapes
: 
�
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1IdentityTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_1:1*
T0*
_output_shapes
: 
�
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_2IdentityTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_2:1*
_output_shapes
: *
T0
�
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_3IdentityTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_3:1*
T0*
_output_shapes

:i
�
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_4IdentityTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_4:1*
_output_shapes

:i*
T0
�
Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add/yConstS^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
dtype0*
_output_shapes
: *
value	B :
�
Mmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/addAddRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/IdentityOmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add/y*
_output_shapes
: *
T0
�
[model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3TensorArrayReadV3amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/EnterTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1*
dtype0*
_output_shapes
:	i�
�
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/EnterEnterQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1*
T0*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:
�
cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1Enter~model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqualGreaterEqualTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1\model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqual/Enter*
T0*
_output_shapes
:i
�
\model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqual/EnterEnterOmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLen*
T0*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:i
�
ulstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shapeConst*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB"�      *
dtype0*
_output_shapes
:
�
slstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/minConst*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB
 *�2�*
dtype0*
_output_shapes
: 
�
slstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/maxConst*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB
 *�2>*
dtype0*
_output_shapes
: 
�
}lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniformRandomUniformulstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shape*
dtype0*
_output_shapes
:	�*

seed *
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
seed2 
�
slstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/subSubslstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/maxslstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
slstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mulMul}lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniformslstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/sub*
_output_shapes
:	�*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
olstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniformAddslstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mulslstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*
_output_shapes
:	�*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
Tlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel
VariableV2*
dtype0*
_output_shapes
:	�*
shared_name *g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
	container *
shape:	�
�
[lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignAssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelolstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	�
�
Ylstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/readIdentityTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
T0*
_output_shapes
:	�
�
tlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/shape_as_tensorConst*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
valueB:*
dtype0*
_output_shapes
:
�
jlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/ConstConst*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
valueB
 *    *
dtype0*
_output_shapes
: 
�
dlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zerosFilltlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/shape_as_tensorjlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/Const*
T0*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*

index_type0*
_output_shapes
:
�
Rlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias
VariableV2*
dtype0*
_output_shapes
:*
shared_name *e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
	container *
shape:
�
Ylstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignAssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasdlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:
�
Wlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/readIdentityRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
_output_shapes
:*
T0
�
_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/ConstConstS^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
dtype0*
_output_shapes
: *
value	B :
�
emodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axisConstS^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
dtype0*
_output_shapes
: *
value	B :
�
`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concatConcatV2[model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_4emodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axis*
T0*
N*
_output_shapes
:	i�*

Tidx0
�
`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMulMatMul`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concatfmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter*
T0*
transpose_a( *
_output_shapes

:i*
transpose_b( 
�
fmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/EnterEnterYlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read*
T0*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:	�
�
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAddBiasAdd`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMulgmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter*
T0*
data_formatNHWC*
_output_shapes

:i
�
gmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/EnterEnterWlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/read*
T0*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:
�
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_1ConstS^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/splitSplit_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Constamodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd*
	num_split*<
_output_shapes*
(:i:i:i:i*
T0
�
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2ConstS^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
valueB
 *  �?*
dtype0*
_output_shapes
: 
�
]model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/AddAddamodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:2amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2*
T0*
_output_shapes

:i
�
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/SigmoidSigmoid]model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add*
T0*
_output_shapes

:i
�
]model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MulMulTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_3amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid*
_output_shapes

:i*
T0
�
cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1Sigmoid_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split*
T0*
_output_shapes

:i
�
^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/TanhTanhamodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:1*
T0*
_output_shapes

:i
�
_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1Mulcmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh*
T0*
_output_shapes

:i
�
_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1Add]model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1*
T0*
_output_shapes

:i
�
`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1Tanh_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*
T0*
_output_shapes

:i
�
cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2Sigmoidamodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:3*
T0*
_output_shapes

:i
�
_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2Mul`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2*
T0*
_output_shapes

:i
�
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/SelectSelectVmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqualVmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select/Enter_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
T0*r
_classh
fdloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes

:i
�
Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select/EnterEnterImodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zeros*
is_constant(*
_output_shapes

:i*g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
T0*r
_classh
fdloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
parallel_iterations 
�
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_1SelectVmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqualTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_3_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*r
_classh
fdloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*
_output_shapes

:i*
T0
�
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_2SelectVmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqualTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_4_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
T0*r
_classh
fdloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes

:i
�
mmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/SelectTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_2*r
_classh
fdloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes
: *
T0
�
smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterOmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*
is_constant(*
_output_shapes
:*g

frame_nameYWmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
T0*r
_classh
fdloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
parallel_iterations 
�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1/yConstS^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1AddTmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1/y*
_output_shapes
: *
T0
�
Wmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIterationNextIterationMmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add*
T0*
_output_shapes
: 
�
Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_1NextIterationOmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1*
_output_shapes
: *
T0
�
Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_2NextIterationmmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
�
Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_3NextIterationRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_1*
T0*
_output_shapes

:i
�
Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_4NextIterationRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_2*
_output_shapes

:i*
T0
�
Nmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/ExitExitPmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch*
_output_shapes
: *
T0
�
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_1ExitRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_1*
T0*
_output_shapes
: 
�
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_2ExitRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_2*
_output_shapes
: *
T0
�
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_3ExitRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_3*
T0*
_output_shapes

:i
�
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_4ExitRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_4*
T0*
_output_shapes

:i
�
fmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayPmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_2*b
_classX
VTloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*
_output_shapes
: 
�
`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/range/startConst*b
_classX
VTloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*
value	B : *
dtype0*
_output_shapes
: 
�
`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/range/deltaConst*
dtype0*
_output_shapes
: *b
_classX
VTloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*
value	B :
�
Zmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/rangeRange`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/range/startfmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/TensorArraySizeV3`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/range/delta*b
_classX
VTloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*#
_output_shapes
:���������*

Tidx0
�
hmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayZmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/rangePmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_2*
element_shape
:i*b
_classX
VTloc:@model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*
dtype0*"
_output_shapes
:;i
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_5Const*
valueB";   i   *
dtype0*
_output_shapes
:
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_6Const*
_output_shapes
:*
valueB:*
dtype0
�
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2_1/axisConst*
valueB: *
dtype0*
_output_shapes
:
�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2_1	ReverseV2hmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/TensorArrayGatherV3Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2_1/axis*"
_output_shapes
:;i*

Tidx0*
T0
|
:model/lstm2d_1/horizontal_pass/Horizontal_LSTM/concat/axisConst*
value	B :*
dtype0*
_output_shapes
: 
�
5model/lstm2d_1/horizontal_pass/Horizontal_LSTM/concatConcatV2hmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/TensorArrayGatherV3Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2_1:model/lstm2d_1/horizontal_pass/Horizontal_LSTM/concat/axis*"
_output_shapes
:;i*

Tidx0*
T0*
N
�
>model/lstm2d_1/horizontal_pass/Horizontal_LSTM/Reshape_1/shapeConst*%
valueB";   #         *
dtype0*
_output_shapes
:
�
8model/lstm2d_1/horizontal_pass/Horizontal_LSTM/Reshape_1Reshape5model/lstm2d_1/horizontal_pass/Horizontal_LSTM/concat>model/lstm2d_1/horizontal_pass/Horizontal_LSTM/Reshape_1/shape*
T0*
Tshape0*&
_output_shapes
:;#
�
?model/lstm2d_1/horizontal_pass/Horizontal_LSTM/transpose_1/permConst*%
valueB"             *
dtype0*
_output_shapes
:
�
:model/lstm2d_1/horizontal_pass/Horizontal_LSTM/transpose_1	Transpose8model/lstm2d_1/horizontal_pass/Horizontal_LSTM/Reshape_1?model/lstm2d_1/horizontal_pass/Horizontal_LSTM/transpose_1/perm*
T0*&
_output_shapes
:#;*
Tperm0
�
+model/lstm2d_1/vertical_pass/transpose/permConst*%
valueB"             *
dtype0*
_output_shapes
:
�
&model/lstm2d_1/vertical_pass/transpose	Transpose:model/lstm2d_1/horizontal_pass/Horizontal_LSTM/transpose_1+model/lstm2d_1/vertical_pass/transpose/perm*&
_output_shapes
:#;*
Tperm0*
T0
�
;model/lstm2d_1/vertical_pass/Horizontal_LSTM/transpose/permConst*%
valueB"             *
dtype0*
_output_shapes
:
�
6model/lstm2d_1/vertical_pass/Horizontal_LSTM/transpose	Transpose&model/lstm2d_1/vertical_pass/transpose;model/lstm2d_1/vertical_pass/Horizontal_LSTM/transpose/perm*
Tperm0*
T0*&
_output_shapes
:#;
�
:model/lstm2d_1/vertical_pass/Horizontal_LSTM/Reshape/shapeConst*!
valueB"        *
dtype0*
_output_shapes
:
�
4model/lstm2d_1/vertical_pass/Horizontal_LSTM/ReshapeReshape6model/lstm2d_1/vertical_pass/Horizontal_LSTM/transpose:model/lstm2d_1/vertical_pass/Horizontal_LSTM/Reshape/shape*
T0*
Tshape0*#
_output_shapes
:�
�
Zmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/ConstConst*
valueB:�*
dtype0*
_output_shapes
:
�
\model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_1Const*
_output_shapes
:*
valueB:*
dtype0
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
[model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concatConcatV2Zmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const\model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_1`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat/axis*
N*
_output_shapes
:*

Tidx0*
T0
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zeros/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
Zmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zerosFill[model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zeros/Const*
T0*

index_type0*
_output_shapes
:	�
�
\model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_2Const*
dtype0*
_output_shapes
:*
valueB:�
�
\model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_3Const*
valueB:*
dtype0*
_output_shapes
:
�
\model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_4Const*
valueB:�*
dtype0*
_output_shapes
:
�
\model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_5Const*
valueB:*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
]model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat_1ConcatV2\model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_4\model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_5bmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat_1/axis*

Tidx0*
T0*
N*
_output_shapes
:
�
bmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
\model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1Fill]model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat_1bmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1/Const*

index_type0*
_output_shapes
:	�*
T0
�
\model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_6Const*
valueB:�*
dtype0*
_output_shapes
:
�
\model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_7Const*
valueB:*
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/Fill/dimsConst*
dtype0*
_output_shapes
:*
valueB:�
�
Hmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/Fill/valueConst*
dtype0*
_output_shapes
: *
value	B :
�
Bmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/FillFillGmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/Fill/dimsHmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/Fill/value*
T0*

index_type0*
_output_shapes	
:�
�
Emodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/ToInt64CastBmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/Fill*

SrcT0*

DstT0	*
_output_shapes	
:�
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/ToInt32CastEmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/ToInt64*

SrcT0	*

DstT0*
_output_shapes	
:�
�
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/sequence_lengthIdentityImodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/ToInt32*
_output_shapes	
:�*
T0
�
^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/ConstConst*
valueB:�*
dtype0*
_output_shapes
:
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_1Const*
valueB:*
dtype0*
_output_shapes
:
�
dmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concatConcatV2^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_1dmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
�
dmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zerosFill_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concatdmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros/Const*
T0*

index_type0*
_output_shapes
:	�
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_2Const*
valueB:�*
dtype0*
_output_shapes
:
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_3Const*
_output_shapes
:*
valueB:*
dtype0
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_4Const*
valueB:�*
dtype0*
_output_shapes
:
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_5Const*
dtype0*
_output_shapes
:*
valueB:
�
fmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1ConcatV2`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_4`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_5fmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1/axis*
N*
_output_shapes
:*

Tidx0*
T0
�
fmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1Fillamodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1fmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1/Const*
_output_shapes
:	�*
T0*

index_type0
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_6Const*
valueB:�*
dtype0*
_output_shapes
:
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_7Const*
valueB:*
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/ShapeConst*
_output_shapes
:*
valueB:�*
dtype0
�
Gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/stackConst*
valueB:�*
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/EqualEqualGmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/ShapeGmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/stack*
_output_shapes
:*
T0
�
Gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/ConstConst*
valueB: *
dtype0*
_output_shapes
:
�
Emodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/AllAllGmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/EqualGmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const*
_output_shapes
: *
	keep_dims( *

Tidx0
�
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/ConstConst*�
valueyBw BqExpected shape for Tensor model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/sequence_length:0 is *
dtype0*
_output_shapes
: 
�
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Const_1Const*!
valueB B but saw shape: *
dtype0*
_output_shapes
: 
�
Vmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Assert/data_0Const*
dtype0*
_output_shapes
: *�
valueyBw BqExpected shape for Tensor model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/sequence_length:0 is 
�
Vmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Assert/data_2Const*!
valueB B but saw shape: *
dtype0*
_output_shapes
: 
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/AssertAssertEmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/AllVmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Assert/data_0Gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/stackVmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Assert/data_2Gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Shape*
T
2*
	summarize
�
Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLenIdentityQmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/sequence_lengthP^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Assert*
T0*
_output_shapes	
:�
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Shape_1Const*!
valueB"        *
dtype0*
_output_shapes
:
�
Umodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_sliceStridedSliceImodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Shape_1Umodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stackWmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stack_1Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stack_2*
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_1Const*
valueB:�*
dtype0*
_output_shapes
:
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_2Const*
valueB:*
dtype0*
_output_shapes
:
�
Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
Hmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/concatConcatV2Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_1Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_2Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/concat/axis*
_output_shapes
:*

Tidx0*
T0*
N
�
Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
Gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zerosFillHmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/concatMmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zeros/Const*
T0*

index_type0*
_output_shapes
:	�
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_3Const*
valueB: *
dtype0*
_output_shapes
:
�
Emodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/MinMinMmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLenImodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_3*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_4Const*
valueB: *
dtype0*
_output_shapes
:
�
Emodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/MaxMaxMmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLenImodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_4*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
�
Fmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/timeConst*
value	B : *
dtype0*
_output_shapes
: 
�
Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayTensorArrayV3Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice*m
tensor_array_nameXVmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/dynamic_rnn/output_0*
dtype0*
_output_shapes

:: *
element_shape:	�*
clear_after_read(*
dynamic_size( *
identical_element_shapes(
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1TensorArrayV3Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice*
clear_after_read(*
dynamic_size( *
identical_element_shapes(*l
tensor_array_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/dynamic_rnn/input_0*
dtype0*
_output_shapes

:: *
element_shape:	�
�
Zmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/ShapeConst*!
valueB"        *
dtype0*
_output_shapes
:
�
hmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
jmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
jmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
�
bmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_sliceStridedSliceZmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/Shapehmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stackjmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_1jmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_2*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
�
Zmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/rangeRange`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/range/startbmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/range/delta*#
_output_shapes
:���������*

Tidx0
�
|model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1Zmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/range4model/lstm2d_1/vertical_pass/Horizontal_LSTM/ReshapeQmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1:1*G
_class=
;9loc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/Reshape*
_output_shapes
: *
T0
�
Kmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Maximum/xConst*
value	B :*
dtype0*
_output_shapes
: 
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/MaximumMaximumKmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Maximum/xEmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Max*
T0*
_output_shapes
: 
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/MinimumMinimumOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_sliceImodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Maximum*
_output_shapes
: *
T0
�
Ymodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/iteration_counterConst*
value	B : *
dtype0*
_output_shapes
: 
�
Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/EnterEnterYmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/iteration_counter*
T0*
is_constant( *
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_1EnterFmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/time*
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: *
T0*
is_constant( 
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_2EnterOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray:1*
T0*
is_constant( *
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_3Enter^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros*
T0*
is_constant( *
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:	�
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_4Enter`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1*e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:	�*
T0*
is_constant( *
parallel_iterations 
�
Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/MergeMergeMmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/EnterUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration*
N*
_output_shapes
: : *
T0
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1MergeOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_1Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_1*
N*
_output_shapes
: : *
T0
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_2MergeOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_2Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_2*
N*
_output_shapes
: : *
T0
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_3MergeOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_3Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_3*
T0*
N*!
_output_shapes
:	�: 
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_4MergeOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_4Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_4*!
_output_shapes
:	�: *
T0*
N
�
Lmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LessLessMmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/MergeRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less/Enter*
T0*
_output_shapes
: 
�
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less/EnterEnterOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice*
T0*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1LessOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1/Enter*
_output_shapes
: *
T0
�
Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1/EnterEnterImodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Minimum*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: *
T0
�
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LogicalAnd
LogicalAndLmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LessNmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1*
_output_shapes
: 
�
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCondLoopCondRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LogicalAnd*
_output_shapes
: 
�
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/SwitchSwitchMmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/MergePmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond*
T0*`
_classV
TRloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge*
_output_shapes
: : 
�
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_1SwitchOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond*b
_classX
VTloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1*
_output_shapes
: : *
T0
�
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_2SwitchOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_2Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond*
T0*b
_classX
VTloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_2*
_output_shapes
: : 
�
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_3SwitchOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_3Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond*
T0*b
_classX
VTloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_3**
_output_shapes
:	�:	�
�
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_4SwitchOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_4Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond**
_output_shapes
:	�:	�*
T0*b
_classX
VTloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_4
�
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/IdentityIdentityPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch:1*
T0*
_output_shapes
: 
�
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1IdentityRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_1:1*
_output_shapes
: *
T0
�
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_2IdentityRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_2:1*
T0*
_output_shapes
: 
�
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_3IdentityRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_3:1*
_output_shapes
:	�*
T0
�
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_4IdentityRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_4:1*
T0*
_output_shapes
:	�
�
Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add/yConstQ^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
Kmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/addAddPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/IdentityMmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add/y*
_output_shapes
: *
T0
�
Ymodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3TensorArrayReadV3_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/EnterRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1*
dtype0*
_output_shapes
:	�
�
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/EnterEnterOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1*
T0*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:
�
amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1Enter|model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqualGreaterEqualRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1Zmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqual/Enter*
T0*
_output_shapes	
:�
�
Zmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqual/EnterEnterMmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLen*
T0*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes	
:�
�
slstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shapeConst*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB"      *
dtype0*
_output_shapes
:
�
qlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/minConst*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB
 *�m�*
dtype0*
_output_shapes
: 
�
qlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/maxConst*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB
 *�m?*
dtype0*
_output_shapes
: 
�
{lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniformRandomUniformslstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shape*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
seed2 *
dtype0*
_output_shapes

:*

seed *
T0
�
qlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/subSubqlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/maxqlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
qlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mulMul{lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniformqlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/sub*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
_output_shapes

:
�
mlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniformAddqlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mulqlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
_output_shapes

:
�
Rlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel
VariableV2*
shared_name *e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
	container *
shape
:*
dtype0*
_output_shapes

:
�
Ylstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignAssignRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelmlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes

:
�
Wlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/readIdentityRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
T0*
_output_shapes

:
�
rlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/shape_as_tensorConst*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
valueB:*
dtype0*
_output_shapes
:
�
hlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/ConstConst*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
valueB
 *    *
dtype0*
_output_shapes
: 
�
blstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zerosFillrlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/shape_as_tensorhlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/Const*
T0*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*

index_type0*
_output_shapes
:
�
Plstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias
VariableV2*
shared_name *c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
	container *
shape:*
dtype0*
_output_shapes
:
�
Wlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignAssignPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasblstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:
�
Ulstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/readIdentityPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
T0*
_output_shapes
:
�
]model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/ConstConstQ^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
dtype0*
_output_shapes
: *
value	B :
�
cmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axisConstQ^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concatConcatV2Ymodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_4cmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axis*

Tidx0*
T0*
N*
_output_shapes
:	�
�
^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMulMatMul^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concatdmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter*
transpose_b( *
T0*
transpose_a( *
_output_shapes
:	�
�
dmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/EnterEnterWlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read*
T0*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes

:
�
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAddBiasAdd^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMulemodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter*
T0*
data_formatNHWC*
_output_shapes
:	�
�
emodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/EnterEnterUlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/read*
T0*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:
�
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_1ConstQ^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
]model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/splitSplit]model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd*
T0*
	num_split*@
_output_shapes.
,:	�:	�:	�:	�
�
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2ConstQ^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
valueB
 *  �?*
dtype0*
_output_shapes
: 
�
[model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/AddAdd_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:2_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2*
T0*
_output_shapes
:	�
�
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/SigmoidSigmoid[model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add*
T0*
_output_shapes
:	�
�
[model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MulMulRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_3_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid*
T0*
_output_shapes
:	�
�
amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1Sigmoid]model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split*
T0*
_output_shapes
:	�
�
\model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/TanhTanh_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:1*
T0*
_output_shapes
:	�
�
]model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1Mulamodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1\model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh*
T0*
_output_shapes
:	�
�
]model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1Add[model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul]model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1*
T0*
_output_shapes
:	�
�
^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1Tanh]model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*
_output_shapes
:	�*
T0
�
amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2Sigmoid_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:3*
_output_shapes
:	�*
T0
�
]model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2Mul^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2*
T0*
_output_shapes
:	�
�
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/SelectSelectTmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqualTmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select/Enter]model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
T0*p
_classf
dbloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes
:	�
�
Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select/EnterEnterGmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zeros*
T0*p
_classf
dbloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
parallel_iterations *
is_constant(*
_output_shapes
:	�*e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context
�
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_1SelectTmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqualRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_3]model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*
_output_shapes
:	�*
T0*p
_classf
dbloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1
�
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_2SelectTmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqualRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_4]model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
T0*p
_classf
dbloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes
:	�
�
kmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/SelectRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_2*
T0*p
_classf
dbloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes
: 
�
qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterMmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*
is_constant(*
_output_shapes
:*e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
T0*p
_classf
dbloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
parallel_iterations 
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1/yConstQ^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1AddRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1/y*
_output_shapes
: *
T0
�
Umodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIterationNextIterationKmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add*
_output_shapes
: *
T0
�
Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_1NextIterationMmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1*
T0*
_output_shapes
: 
�
Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_2NextIterationkmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
�
Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_3NextIterationPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_1*
T0*
_output_shapes
:	�
�
Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_4NextIterationPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_2*
T0*
_output_shapes
:	�
�
Lmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/ExitExitNmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch*
T0*
_output_shapes
: 
�
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_1ExitPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_1*
_output_shapes
: *
T0
�
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_2ExitPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_2*
T0*
_output_shapes
: 
�
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_3ExitPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_3*
T0*
_output_shapes
:	�
�
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_4ExitPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_4*
T0*
_output_shapes
:	�
�
dmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayNmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_2*`
_classV
TRloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*
_output_shapes
: 
�
^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/range/startConst*`
_classV
TRloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*
value	B : *
dtype0*
_output_shapes
: 
�
^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/range/deltaConst*`
_classV
TRloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*
value	B :*
dtype0*
_output_shapes
: 
�
Xmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/rangeRange^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/range/startdmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/TensorArraySizeV3^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/range/delta*`
_classV
TRloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*#
_output_shapes
:���������*

Tidx0
�
fmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayXmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/rangeNmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_2*
element_shape:	�*`
_classV
TRloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*
dtype0*#
_output_shapes
:�
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_5Const*
valueB"     *
dtype0*
_output_shapes
:
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_6Const*
dtype0*
_output_shapes
:*
valueB:
�
Zmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/ConstConst*
valueB:�*
dtype0*
_output_shapes
:
�
\model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_1Const*
valueB:*
dtype0*
_output_shapes
:
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
[model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concatConcatV2Zmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const\model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_1`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat/axis*
N*
_output_shapes
:*

Tidx0*
T0
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
Zmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zerosFill[model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zeros/Const*
T0*

index_type0*
_output_shapes
:	�
�
\model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_2Const*
valueB:�*
dtype0*
_output_shapes
:
�
\model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_3Const*
valueB:*
dtype0*
_output_shapes
:
�
\model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_4Const*
valueB:�*
dtype0*
_output_shapes
:
�
\model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_5Const*
valueB:*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat_1/axisConst*
_output_shapes
: *
value	B : *
dtype0
�
]model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat_1ConcatV2\model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_4\model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_5bmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat_1/axis*
T0*
N*
_output_shapes
:*

Tidx0
�
bmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
\model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1Fill]model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat_1bmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1/Const*
T0*

index_type0*
_output_shapes
:	�
�
\model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_6Const*
valueB:�*
dtype0*
_output_shapes
:
�
\model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_7Const*
valueB:*
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/Fill/dimsConst*
valueB:�*
dtype0*
_output_shapes
:
�
Hmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/Fill/valueConst*
value	B :*
dtype0*
_output_shapes
: 
�
Bmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/FillFillGmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/Fill/dimsHmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/Fill/value*
T0*

index_type0*
_output_shapes	
:�
�
Emodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ToInt64CastBmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/Fill*

DstT0	*
_output_shapes	
:�*

SrcT0
�
Lmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2/axisConst*
_output_shapes
:*
valueB: *
dtype0
�
Gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2	ReverseV24model/lstm2d_1/vertical_pass/Horizontal_LSTM/ReshapeLmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2/axis*#
_output_shapes
:�*

Tidx0*
T0
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/ToInt32CastEmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ToInt64*

SrcT0	*

DstT0*
_output_shapes	
:�
�
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/sequence_lengthIdentityImodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/ToInt32*
T0*
_output_shapes	
:�
�
^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/ConstConst*
valueB:�*
dtype0*
_output_shapes
:
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_1Const*
valueB:*
dtype0*
_output_shapes
:
�
dmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concatConcatV2^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_1dmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat/axis*

Tidx0*
T0*
N*
_output_shapes
:
�
dmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zerosFill_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concatdmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros/Const*
T0*

index_type0*
_output_shapes
:	�
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_2Const*
valueB:�*
dtype0*
_output_shapes
:
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_3Const*
valueB:*
dtype0*
_output_shapes
:
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_4Const*
valueB:�*
dtype0*
_output_shapes
:
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_5Const*
valueB:*
dtype0*
_output_shapes
:
�
fmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1ConcatV2`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_4`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_5fmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1/axis*

Tidx0*
T0*
N*
_output_shapes
:
�
fmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1Fillamodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1fmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1/Const*
T0*

index_type0*
_output_shapes
:	�
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_6Const*
valueB:�*
dtype0*
_output_shapes
:
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_7Const*
_output_shapes
:*
valueB:*
dtype0
�
Gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/ShapeConst*
valueB:�*
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/stackConst*
valueB:�*
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/EqualEqualGmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/ShapeGmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/stack*
_output_shapes
:*
T0
�
Gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/ConstConst*
valueB: *
dtype0*
_output_shapes
:
�
Emodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/AllAllGmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/EqualGmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const*
_output_shapes
: *
	keep_dims( *

Tidx0
�
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/ConstConst*
dtype0*
_output_shapes
: *�
valueyBw BqExpected shape for Tensor model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/sequence_length:0 is 
�
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Const_1Const*!
valueB B but saw shape: *
dtype0*
_output_shapes
: 
�
Vmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Assert/data_0Const*�
valueyBw BqExpected shape for Tensor model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/sequence_length:0 is *
dtype0*
_output_shapes
: 
�
Vmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Assert/data_2Const*!
valueB B but saw shape: *
dtype0*
_output_shapes
: 
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/AssertAssertEmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/AllVmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Assert/data_0Gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/stackVmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Assert/data_2Gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Shape*
T
2*
	summarize
�
Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLenIdentityQmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/sequence_lengthP^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Assert*
T0*
_output_shapes	
:�
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Shape_1Const*!
valueB"        *
dtype0*
_output_shapes
:
�
Umodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_sliceStridedSliceImodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Shape_1Umodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stackWmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stack_1Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_1Const*
valueB:�*
dtype0*
_output_shapes
:
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_2Const*
_output_shapes
:*
valueB:*
dtype0
�
Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
Hmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/concatConcatV2Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_1Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_2Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/concat/axis*
_output_shapes
:*

Tidx0*
T0*
N
�
Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
Gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zerosFillHmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/concatMmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zeros/Const*
T0*

index_type0*
_output_shapes
:	�
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_3Const*
valueB: *
dtype0*
_output_shapes
:
�
Emodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/MinMinMmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLenImodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_3*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_4Const*
valueB: *
dtype0*
_output_shapes
:
�
Emodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/MaxMaxMmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLenImodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_4*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
�
Fmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/timeConst*
value	B : *
dtype0*
_output_shapes
: 
�
Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayTensorArrayV3Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice*
identical_element_shapes(*m
tensor_array_nameXVmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/dynamic_rnn/output_0*
dtype0*
_output_shapes

:: *
element_shape:	�*
dynamic_size( *
clear_after_read(
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1TensorArrayV3Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice*l
tensor_array_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/dynamic_rnn/input_0*
dtype0*
_output_shapes

:: *
element_shape:	�*
dynamic_size( *
clear_after_read(*
identical_element_shapes(
�
Zmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/ShapeConst*!
valueB"        *
dtype0*
_output_shapes
:
�
hmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
jmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
jmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_sliceStridedSliceZmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/Shapehmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stackjmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_1jmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_2*
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask 
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
�
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
�
Zmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/rangeRange`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/range/startbmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/range/delta*#
_output_shapes
:���������*

Tidx0
�
|model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1Zmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/rangeGmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1:1*
T0*Z
_classP
NLloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2*
_output_shapes
: 
�
Kmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Maximum/xConst*
value	B :*
dtype0*
_output_shapes
: 
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/MaximumMaximumKmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Maximum/xEmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Max*
_output_shapes
: *
T0
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/MinimumMinimumOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_sliceImodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Maximum*
T0*
_output_shapes
: 
�
Ymodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/iteration_counterConst*
dtype0*
_output_shapes
: *
value	B : 
�
Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/EnterEnterYmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/iteration_counter*
T0*
is_constant( *
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_1EnterFmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/time*
T0*
is_constant( *
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_2EnterOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray:1*
T0*
is_constant( *
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_3Enter^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros*
T0*
is_constant( *
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:	�
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_4Enter`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1*
T0*
is_constant( *
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:	�
�
Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/MergeMergeMmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/EnterUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration*
T0*
N*
_output_shapes
: : 
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1MergeOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_1Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_1*
T0*
N*
_output_shapes
: : 
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_2MergeOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_2Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_2*
N*
_output_shapes
: : *
T0
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_3MergeOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_3Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_3*
T0*
N*!
_output_shapes
:	�: 
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_4MergeOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_4Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_4*
T0*
N*!
_output_shapes
:	�: 
�
Lmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LessLessMmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/MergeRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less/Enter*
_output_shapes
: *
T0
�
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less/EnterEnterOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: *
T0
�
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1LessOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1/Enter*
T0*
_output_shapes
: 
�
Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1/EnterEnterImodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Minimum*
T0*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LogicalAnd
LogicalAndLmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LessNmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1*
_output_shapes
: 
�
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCondLoopCondRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LogicalAnd*
_output_shapes
: 
�
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/SwitchSwitchMmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/MergePmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond*
T0*`
_classV
TRloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge*
_output_shapes
: : 
�
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_1SwitchOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond*
T0*b
_classX
VTloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1*
_output_shapes
: : 
�
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_2SwitchOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_2Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond*
T0*b
_classX
VTloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_2*
_output_shapes
: : 
�
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_3SwitchOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_3Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond**
_output_shapes
:	�:	�*
T0*b
_classX
VTloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_3
�
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_4SwitchOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_4Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond*
T0*b
_classX
VTloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_4**
_output_shapes
:	�:	�
�
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/IdentityIdentityPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch:1*
T0*
_output_shapes
: 
�
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1IdentityRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_1:1*
T0*
_output_shapes
: 
�
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_2IdentityRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_2:1*
_output_shapes
: *
T0
�
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_3IdentityRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_3:1*
T0*
_output_shapes
:	�
�
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_4IdentityRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_4:1*
T0*
_output_shapes
:	�
�
Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add/yConstQ^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
dtype0*
_output_shapes
: *
value	B :
�
Kmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/addAddPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/IdentityMmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add/y*
T0*
_output_shapes
: 
�
Ymodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3TensorArrayReadV3_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/EnterRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1*
dtype0*
_output_shapes
:	�
�
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/EnterEnterOmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:*
T0
�
amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1Enter|model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqualGreaterEqualRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1Zmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqual/Enter*
T0*
_output_shapes	
:�
�
Zmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqual/EnterEnterMmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLen*
T0*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes	
:�
�
slstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB"      *
dtype0
�
qlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/minConst*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB
 *�m�*
dtype0*
_output_shapes
: 
�
qlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/maxConst*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB
 *�m?*
dtype0*
_output_shapes
: 
�
{lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniformRandomUniformslstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shape*
dtype0*
_output_shapes

:*

seed *
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
seed2 
�
qlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/subSubqlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/maxqlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
qlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mulMul{lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniformqlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/sub*
_output_shapes

:*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
mlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniformAddqlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mulqlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
_output_shapes

:
�
Rlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel
VariableV2*
	container *
shape
:*
dtype0*
_output_shapes

:*
shared_name *e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
Ylstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignAssignRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelmlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform*
validate_shape(*
_output_shapes

:*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
Wlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/readIdentityRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
T0*
_output_shapes

:
�
rlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/shape_as_tensorConst*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
valueB:*
dtype0*
_output_shapes
:
�
hlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/ConstConst*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
valueB
 *    *
dtype0*
_output_shapes
: 
�
blstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zerosFillrlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/shape_as_tensorhlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/Const*
T0*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*

index_type0*
_output_shapes
:
�
Plstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias
VariableV2*
_output_shapes
:*
shared_name *c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
	container *
shape:*
dtype0
�
Wlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignAssignPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasblstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros*
_output_shapes
:*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(
�
Ulstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/readIdentityPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
_output_shapes
:*
T0
�
]model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/ConstConstQ^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
cmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axisConstQ^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
dtype0*
_output_shapes
: *
value	B :
�
^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concatConcatV2Ymodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_4cmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axis*
_output_shapes
:	�*

Tidx0*
T0*
N
�
^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMulMatMul^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concatdmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter*
transpose_a( *
_output_shapes
:	�*
transpose_b( *
T0
�
dmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/EnterEnterWlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read*
T0*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes

:
�
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAddBiasAdd^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMulemodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter*
T0*
data_formatNHWC*
_output_shapes
:	�
�
emodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/EnterEnterUlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/read*
parallel_iterations *e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:*
T0*
is_constant(
�
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_1ConstQ^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
]model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/splitSplit]model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd*
T0*
	num_split*@
_output_shapes.
,:	�:	�:	�:	�
�
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2ConstQ^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
valueB
 *  �?*
dtype0*
_output_shapes
: 
�
[model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/AddAdd_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:2_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2*
_output_shapes
:	�*
T0
�
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/SigmoidSigmoid[model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add*
_output_shapes
:	�*
T0
�
[model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MulMulRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_3_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid*
T0*
_output_shapes
:	�
�
amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1Sigmoid]model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split*
T0*
_output_shapes
:	�
�
\model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/TanhTanh_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:1*
T0*
_output_shapes
:	�
�
]model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1Mulamodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1\model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh*
_output_shapes
:	�*
T0
�
]model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1Add[model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul]model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1*
T0*
_output_shapes
:	�
�
^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1Tanh]model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*
T0*
_output_shapes
:	�
�
amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2Sigmoid_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:3*
T0*
_output_shapes
:	�
�
]model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2Mul^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2*
T0*
_output_shapes
:	�
�
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/SelectSelectTmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqualTmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select/Enter]model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes
:	�*
T0*p
_classf
dbloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2
�
Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select/EnterEnterGmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zeros*
_output_shapes
:	�*e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
T0*p
_classf
dbloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
parallel_iterations *
is_constant(
�
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_1SelectTmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqualRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_3]model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*
_output_shapes
:	�*
T0*p
_classf
dbloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1
�
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_2SelectTmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqualRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_4]model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*p
_classf
dbloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes
:	�*
T0
�
kmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/SelectRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_2*
_output_shapes
: *
T0*p
_classf
dbloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2
�
qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterMmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*
parallel_iterations *
is_constant(*
_output_shapes
:*e

frame_nameWUmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
T0*p
_classf
dbloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2
�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1/yConstQ^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1AddRmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1/y*
T0*
_output_shapes
: 
�
Umodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIterationNextIterationKmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add*
T0*
_output_shapes
: 
�
Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_1NextIterationMmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1*
T0*
_output_shapes
: 
�
Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_2NextIterationkmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
�
Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_3NextIterationPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_1*
T0*
_output_shapes
:	�
�
Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_4NextIterationPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_2*
_output_shapes
:	�*
T0
�
Lmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/ExitExitNmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch*
_output_shapes
: *
T0
�
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_1ExitPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_1*
T0*
_output_shapes
: 
�
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_2ExitPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_2*
T0*
_output_shapes
: 
�
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_3ExitPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_3*
_output_shapes
:	�*
T0
�
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_4ExitPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_4*
T0*
_output_shapes
:	�
�
dmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayNmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_2*`
_classV
TRloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*
_output_shapes
: 
�
^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/range/startConst*`
_classV
TRloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*
value	B : *
dtype0*
_output_shapes
: 
�
^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/range/deltaConst*`
_classV
TRloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*
value	B :*
dtype0*
_output_shapes
: 
�
Xmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/rangeRange^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/range/startdmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/TensorArraySizeV3^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/range/delta*

Tidx0*`
_classV
TRloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*#
_output_shapes
:���������
�
fmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayXmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/rangeNmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_2*
element_shape:	�*`
_classV
TRloc:@model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*
dtype0*#
_output_shapes
:�
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_5Const*
valueB"     *
dtype0*
_output_shapes
:
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_6Const*
valueB:*
dtype0*
_output_shapes
:
�
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2_1/axisConst*
dtype0*
_output_shapes
:*
valueB: 
�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2_1	ReverseV2fmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/TensorArrayGatherV3Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2_1/axis*
T0*#
_output_shapes
:�*

Tidx0
z
8model/lstm2d_1/vertical_pass/Horizontal_LSTM/concat/axisConst*
value	B :*
dtype0*
_output_shapes
: 
�
3model/lstm2d_1/vertical_pass/Horizontal_LSTM/concatConcatV2fmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/TensorArrayGatherV3Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2_18model/lstm2d_1/vertical_pass/Horizontal_LSTM/concat/axis*
T0*
N*#
_output_shapes
:�*

Tidx0
�
<model/lstm2d_1/vertical_pass/Horizontal_LSTM/Reshape_1/shapeConst*%
valueB"   #   ;      *
dtype0*
_output_shapes
:
�
6model/lstm2d_1/vertical_pass/Horizontal_LSTM/Reshape_1Reshape3model/lstm2d_1/vertical_pass/Horizontal_LSTM/concat<model/lstm2d_1/vertical_pass/Horizontal_LSTM/Reshape_1/shape*&
_output_shapes
:#;*
T0*
Tshape0
�
=model/lstm2d_1/vertical_pass/Horizontal_LSTM/transpose_1/permConst*%
valueB"             *
dtype0*
_output_shapes
:
�
8model/lstm2d_1/vertical_pass/Horizontal_LSTM/transpose_1	Transpose6model/lstm2d_1/vertical_pass/Horizontal_LSTM/Reshape_1=model/lstm2d_1/vertical_pass/Horizontal_LSTM/transpose_1/perm*
Tperm0*
T0*&
_output_shapes
:#;
v
model/lstm2d_1/transpose/permConst*%
valueB"             *
dtype0*
_output_shapes
:
�
model/lstm2d_1/transpose	Transpose8model/lstm2d_1/vertical_pass/Horizontal_LSTM/transpose_1model/lstm2d_1/transpose/perm*&
_output_shapes
:#;*
Tperm0*
T0
�
8fully_connected/weights/Initializer/random_uniform/shapeConst**
_class 
loc:@fully_connected/weights*
valueB"      *
dtype0*
_output_shapes
:
�
6fully_connected/weights/Initializer/random_uniform/minConst**
_class 
loc:@fully_connected/weights*
valueB
 *׳]�*
dtype0*
_output_shapes
: 
�
6fully_connected/weights/Initializer/random_uniform/maxConst**
_class 
loc:@fully_connected/weights*
valueB
 *׳]?*
dtype0*
_output_shapes
: 
�
@fully_connected/weights/Initializer/random_uniform/RandomUniformRandomUniform8fully_connected/weights/Initializer/random_uniform/shape*
dtype0*
_output_shapes

:*

seed *
T0**
_class 
loc:@fully_connected/weights*
seed2 
�
6fully_connected/weights/Initializer/random_uniform/subSub6fully_connected/weights/Initializer/random_uniform/max6fully_connected/weights/Initializer/random_uniform/min*
_output_shapes
: *
T0**
_class 
loc:@fully_connected/weights
�
6fully_connected/weights/Initializer/random_uniform/mulMul@fully_connected/weights/Initializer/random_uniform/RandomUniform6fully_connected/weights/Initializer/random_uniform/sub*
T0**
_class 
loc:@fully_connected/weights*
_output_shapes

:
�
2fully_connected/weights/Initializer/random_uniformAdd6fully_connected/weights/Initializer/random_uniform/mul6fully_connected/weights/Initializer/random_uniform/min*
T0**
_class 
loc:@fully_connected/weights*
_output_shapes

:
�
fully_connected/weights
VariableV2*
shared_name **
_class 
loc:@fully_connected/weights*
	container *
shape
:*
dtype0*
_output_shapes

:
�
fully_connected/weights/AssignAssignfully_connected/weights2fully_connected/weights/Initializer/random_uniform*
use_locking(*
T0**
_class 
loc:@fully_connected/weights*
validate_shape(*
_output_shapes

:
�
fully_connected/weights/readIdentityfully_connected/weights*
T0**
_class 
loc:@fully_connected/weights*
_output_shapes

:
�
.model/fully_connected/Tensordot/transpose/permConst*%
valueB"             *
dtype0*
_output_shapes
:
�
)model/fully_connected/Tensordot/transpose	Transposemodel/lstm2d_1/transpose.model/fully_connected/Tensordot/transpose/perm*
T0*&
_output_shapes
:#;*
Tperm0
~
-model/fully_connected/Tensordot/Reshape/shapeConst*
valueB"3     *
dtype0*
_output_shapes
:
�
'model/fully_connected/Tensordot/ReshapeReshape)model/fully_connected/Tensordot/transpose-model/fully_connected/Tensordot/Reshape/shape*
_output_shapes
:	�0*
T0*
Tshape0
�
0model/fully_connected/Tensordot/transpose_1/permConst*
valueB"       *
dtype0*
_output_shapes
:
�
+model/fully_connected/Tensordot/transpose_1	Transposefully_connected/weights/read0model/fully_connected/Tensordot/transpose_1/perm*
T0*
_output_shapes

:*
Tperm0
�
/model/fully_connected/Tensordot/Reshape_1/shapeConst*
valueB"      *
dtype0*
_output_shapes
:
�
)model/fully_connected/Tensordot/Reshape_1Reshape+model/fully_connected/Tensordot/transpose_1/model/fully_connected/Tensordot/Reshape_1/shape*
T0*
Tshape0*
_output_shapes

:
�
&model/fully_connected/Tensordot/MatMulMatMul'model/fully_connected/Tensordot/Reshape)model/fully_connected/Tensordot/Reshape_1*
transpose_a( *
_output_shapes
:	�0*
transpose_b( *
T0
~
%model/fully_connected/Tensordot/shapeConst*%
valueB"#      ;      *
dtype0*
_output_shapes
:
�
model/fully_connected/TensordotReshape&model/fully_connected/Tensordot/MatMul%model/fully_connected/Tensordot/shape*
T0*
Tshape0*&
_output_shapes
:#;
�
@fully_connected/BatchNorm/beta/Initializer/zeros/shape_as_tensorConst*
_output_shapes
:*1
_class'
%#loc:@fully_connected/BatchNorm/beta*
valueB:*
dtype0
�
6fully_connected/BatchNorm/beta/Initializer/zeros/ConstConst*
dtype0*
_output_shapes
: *1
_class'
%#loc:@fully_connected/BatchNorm/beta*
valueB
 *    
�
0fully_connected/BatchNorm/beta/Initializer/zerosFill@fully_connected/BatchNorm/beta/Initializer/zeros/shape_as_tensor6fully_connected/BatchNorm/beta/Initializer/zeros/Const*
_output_shapes
:*
T0*1
_class'
%#loc:@fully_connected/BatchNorm/beta*

index_type0
�
fully_connected/BatchNorm/beta
VariableV2*
dtype0*
_output_shapes
:*
shared_name *1
_class'
%#loc:@fully_connected/BatchNorm/beta*
	container *
shape:
�
%fully_connected/BatchNorm/beta/AssignAssignfully_connected/BatchNorm/beta0fully_connected/BatchNorm/beta/Initializer/zeros*
use_locking(*
T0*1
_class'
%#loc:@fully_connected/BatchNorm/beta*
validate_shape(*
_output_shapes
:
�
#fully_connected/BatchNorm/beta/readIdentityfully_connected/BatchNorm/beta*
T0*1
_class'
%#loc:@fully_connected/BatchNorm/beta*
_output_shapes
:
r
%model/fully_connected/BatchNorm/ConstConst*
valueB*  �?*
dtype0*
_output_shapes
:
�
Gfully_connected/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensorConst*8
_class.
,*loc:@fully_connected/BatchNorm/moving_mean*
valueB:*
dtype0*
_output_shapes
:
�
=fully_connected/BatchNorm/moving_mean/Initializer/zeros/ConstConst*8
_class.
,*loc:@fully_connected/BatchNorm/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
�
7fully_connected/BatchNorm/moving_mean/Initializer/zerosFillGfully_connected/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor=fully_connected/BatchNorm/moving_mean/Initializer/zeros/Const*8
_class.
,*loc:@fully_connected/BatchNorm/moving_mean*

index_type0*
_output_shapes
:*
T0
�
%fully_connected/BatchNorm/moving_mean
VariableV2*
	container *
shape:*
dtype0*
_output_shapes
:*
shared_name *8
_class.
,*loc:@fully_connected/BatchNorm/moving_mean
�
,fully_connected/BatchNorm/moving_mean/AssignAssign%fully_connected/BatchNorm/moving_mean7fully_connected/BatchNorm/moving_mean/Initializer/zeros*
T0*8
_class.
,*loc:@fully_connected/BatchNorm/moving_mean*
validate_shape(*
_output_shapes
:*
use_locking(
�
*fully_connected/BatchNorm/moving_mean/readIdentity%fully_connected/BatchNorm/moving_mean*
T0*8
_class.
,*loc:@fully_connected/BatchNorm/moving_mean*
_output_shapes
:
�
Jfully_connected/BatchNorm/moving_variance/Initializer/ones/shape_as_tensorConst*<
_class2
0.loc:@fully_connected/BatchNorm/moving_variance*
valueB:*
dtype0*
_output_shapes
:
�
@fully_connected/BatchNorm/moving_variance/Initializer/ones/ConstConst*
dtype0*
_output_shapes
: *<
_class2
0.loc:@fully_connected/BatchNorm/moving_variance*
valueB
 *  �?
�
:fully_connected/BatchNorm/moving_variance/Initializer/onesFillJfully_connected/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor@fully_connected/BatchNorm/moving_variance/Initializer/ones/Const*<
_class2
0.loc:@fully_connected/BatchNorm/moving_variance*

index_type0*
_output_shapes
:*
T0
�
)fully_connected/BatchNorm/moving_variance
VariableV2*<
_class2
0.loc:@fully_connected/BatchNorm/moving_variance*
	container *
shape:*
dtype0*
_output_shapes
:*
shared_name 
�
0fully_connected/BatchNorm/moving_variance/AssignAssign)fully_connected/BatchNorm/moving_variance:fully_connected/BatchNorm/moving_variance/Initializer/ones*
_output_shapes
:*
use_locking(*
T0*<
_class2
0.loc:@fully_connected/BatchNorm/moving_variance*
validate_shape(
�
.fully_connected/BatchNorm/moving_variance/readIdentity)fully_connected/BatchNorm/moving_variance*
_output_shapes
:*
T0*<
_class2
0.loc:@fully_connected/BatchNorm/moving_variance
�
.model/fully_connected/BatchNorm/FusedBatchNormFusedBatchNormmodel/fully_connected/Tensordot%model/fully_connected/BatchNorm/Const#fully_connected/BatchNorm/beta/read*fully_connected/BatchNorm/moving_mean/read.fully_connected/BatchNorm/moving_variance/read*
is_training( *>
_output_shapes,
*:#;::::*
epsilon%o�:*
T0*
data_formatNHWC
�
model/fully_connected/TanhTanh.model/fully_connected/BatchNorm/FusedBatchNorm*
T0*&
_output_shapes
:#;
�
model/pool2/MaxPoolMaxPoolmodel/fully_connected/Tanh*
ksize
*
paddingVALID*&
_output_shapes
:#*
T0*
strides
*
data_formatNHWC
�
=model/lstm2d_2/horizontal_pass/Horizontal_LSTM/transpose/permConst*%
valueB"             *
dtype0*
_output_shapes
:
�
8model/lstm2d_2/horizontal_pass/Horizontal_LSTM/transpose	Transposemodel/pool2/MaxPool=model/lstm2d_2/horizontal_pass/Horizontal_LSTM/transpose/perm*
T0*&
_output_shapes
:#*
Tperm0
�
<model/lstm2d_2/horizontal_pass/Horizontal_LSTM/Reshape/shapeConst*!
valueB"   #      *
dtype0*
_output_shapes
:
�
6model/lstm2d_2/horizontal_pass/Horizontal_LSTM/ReshapeReshape8model/lstm2d_2/horizontal_pass/Horizontal_LSTM/transpose<model/lstm2d_2/horizontal_pass/Horizontal_LSTM/Reshape/shape*
T0*
Tshape0*"
_output_shapes
:#
�
\model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/ConstConst*
valueB:#*
dtype0*
_output_shapes
:
�
^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_1Const*
valueB:>*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
]model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concatConcatV2\model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_1bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat/axis*

Tidx0*
T0*
N*
_output_shapes
:
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
\model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zerosFill]model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concatbmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zeros/Const*
T0*

index_type0*
_output_shapes

:#>
�
^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_2Const*
dtype0*
_output_shapes
:*
valueB:#
�
^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_3Const*
_output_shapes
:*
valueB:>*
dtype0
�
^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_4Const*
valueB:#*
dtype0*
_output_shapes
:
�
^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_5Const*
valueB:>*
dtype0*
_output_shapes
:
�
dmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat_1ConcatV2^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_4^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_5dmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat_1/axis*
T0*
N*
_output_shapes
:*

Tidx0
�
dmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1Fill_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat_1dmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1/Const*
T0*

index_type0*
_output_shapes

:#>
�
^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_6Const*
_output_shapes
:*
valueB:#*
dtype0
�
^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_7Const*
_output_shapes
:*
valueB:>*
dtype0
�
Imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/Fill/dimsConst*
valueB:#*
dtype0*
_output_shapes
:
�
Jmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/Fill/valueConst*
value	B :*
dtype0*
_output_shapes
: 
�
Dmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/FillFillImodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/Fill/dimsJmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/Fill/value*
T0*

index_type0*
_output_shapes
:#
�
Gmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/ToInt64CastDmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/Fill*

DstT0	*
_output_shapes
:#*

SrcT0
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/ToInt32CastGmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/ToInt64*

SrcT0	*

DstT0*
_output_shapes
:#
�
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/sequence_lengthIdentityKmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/ToInt32*
_output_shapes
:#*
T0
�
`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/ConstConst*
_output_shapes
:*
valueB:#*
dtype0
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_1Const*
valueB:>*
dtype0*
_output_shapes
:
�
fmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
�
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concatConcatV2`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Constbmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_1fmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat/axis*
N*
_output_shapes
:*

Tidx0*
T0
�
fmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zerosFillamodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concatfmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros/Const*
T0*

index_type0*
_output_shapes

:#>
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_2Const*
_output_shapes
:*
valueB:#*
dtype0
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_3Const*
_output_shapes
:*
valueB:>*
dtype0
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_4Const*
dtype0*
_output_shapes
:*
valueB:#
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_5Const*
dtype0*
_output_shapes
:*
valueB:>
�
hmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1ConcatV2bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_4bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_5hmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1/axis*
T0*
N*
_output_shapes
:*

Tidx0
�
hmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1Fillcmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1hmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1/Const*
T0*

index_type0*
_output_shapes

:#>
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_6Const*
valueB:#*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_7Const*
valueB:>*
dtype0*
_output_shapes
:
�
Imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/ShapeConst*
valueB:#*
dtype0*
_output_shapes
:
�
Imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/stackConst*
valueB:#*
dtype0*
_output_shapes
:
�
Imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/EqualEqualImodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/ShapeImodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/stack*
T0*
_output_shapes
:
�
Imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/ConstConst*
valueB: *
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/AllAllImodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/EqualImodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const*
_output_shapes
: *
	keep_dims( *

Tidx0
�
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/ConstConst*�
value{By BsExpected shape for Tensor model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/sequence_length:0 is *
dtype0*
_output_shapes
: 
�
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Const_1Const*!
valueB B but saw shape: *
dtype0*
_output_shapes
: 
�
Xmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Assert/data_0Const*�
value{By BsExpected shape for Tensor model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/sequence_length:0 is *
dtype0*
_output_shapes
: 
�
Xmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Assert/data_2Const*!
valueB B but saw shape: *
dtype0*
_output_shapes
: 
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/AssertAssertGmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/AllXmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Assert/data_0Imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/stackXmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Assert/data_2Imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Shape*
T
2*
	summarize
�
Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLenIdentitySmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/sequence_lengthR^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Assert*
_output_shapes
:#*
T0
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Shape_1Const*!
valueB"   #      *
dtype0*
_output_shapes
:
�
Wmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_sliceStridedSliceKmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Shape_1Wmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stackYmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stack_1Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stack_2*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_1Const*
dtype0*
_output_shapes
:*
valueB:#
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_2Const*
valueB:>*
dtype0*
_output_shapes
:
�
Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
Jmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/concatConcatV2Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_1Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_2Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/concat/axis*

Tidx0*
T0*
N*
_output_shapes
:
�
Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
Imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zerosFillJmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/concatOmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zeros/Const*
_output_shapes

:#>*
T0*

index_type0
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_3Const*
dtype0*
_output_shapes
:*
valueB: 
�
Gmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/MinMinOmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLenKmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_3*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_4Const*
dtype0*
_output_shapes
:*
valueB: 
�
Gmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/MaxMaxOmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLenKmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_4*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
�
Hmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/timeConst*
value	B : *
dtype0*
_output_shapes
: 
�
Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayTensorArrayV3Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice*
element_shape
:#>*
dynamic_size( *
clear_after_read(*
identical_element_shapes(*o
tensor_array_nameZXmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/dynamic_rnn/output_0*
dtype0*
_output_shapes

:: 
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1TensorArrayV3Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice*n
tensor_array_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/dynamic_rnn/input_0*
dtype0*
_output_shapes

:: *
element_shape
:#*
clear_after_read(*
dynamic_size( *
identical_element_shapes(
�
\model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/ShapeConst*
_output_shapes
:*!
valueB"   #      *
dtype0
�
jmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
lmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
lmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
dmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_sliceStridedSlice\model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/Shapejmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stacklmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_1lmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/range/deltaConst*
_output_shapes
: *
value	B :*
dtype0
�
\model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/rangeRangebmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/range/startdmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slicebmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/range/delta*#
_output_shapes
:���������*

Tidx0
�
~model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1\model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/range6model/lstm2d_2/horizontal_pass/Horizontal_LSTM/ReshapeSmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1:1*
T0*I
_class?
=;loc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/Reshape*
_output_shapes
: 
�
Mmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Maximum/xConst*
value	B :*
dtype0*
_output_shapes
: 
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/MaximumMaximumMmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Maximum/xGmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Max*
T0*
_output_shapes
: 
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/MinimumMinimumQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_sliceKmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Maximum*
_output_shapes
: *
T0
�
[model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/iteration_counterConst*
dtype0*
_output_shapes
: *
value	B : 
�
Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/EnterEnter[model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/iteration_counter*
T0*
is_constant( *
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_1EnterHmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/time*
T0*
is_constant( *
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_2EnterQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray:1*
T0*
is_constant( *
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_3Enter`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros*
T0*
is_constant( *
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes

:#>
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_4Enterbmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1*
T0*
is_constant( *
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes

:#>
�
Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/MergeMergeOmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/EnterWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration*
T0*
N*
_output_shapes
: : 
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1MergeQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_1Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_1*
T0*
N*
_output_shapes
: : 
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_2MergeQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_2Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_2*
N*
_output_shapes
: : *
T0
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_3MergeQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_3Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_3* 
_output_shapes
:#>: *
T0*
N
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_4MergeQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_4Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_4* 
_output_shapes
:#>: *
T0*
N
�
Nmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LessLessOmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/MergeTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less/Enter*
T0*
_output_shapes
: 
�
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less/EnterEnterQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice*
T0*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1LessQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1/Enter*
T0*
_output_shapes
: 
�
Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1/EnterEnterKmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Minimum*g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: *
T0*
is_constant(*
parallel_iterations 
�
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LogicalAnd
LogicalAndNmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LessPmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1*
_output_shapes
: 
�
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCondLoopCondTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LogicalAnd*
_output_shapes
: 
�
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/SwitchSwitchOmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/MergeRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond*
_output_shapes
: : *
T0*b
_classX
VTloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge
�
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_1SwitchQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond*
_output_shapes
: : *
T0*d
_classZ
XVloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1
�
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_2SwitchQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_2Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond*
T0*d
_classZ
XVloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_2*
_output_shapes
: : 
�
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_3SwitchQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_3Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond*(
_output_shapes
:#>:#>*
T0*d
_classZ
XVloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_3
�
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_4SwitchQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_4Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond*
T0*d
_classZ
XVloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_4*(
_output_shapes
:#>:#>
�
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/IdentityIdentityRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch:1*
T0*
_output_shapes
: 
�
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1IdentityTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_1:1*
T0*
_output_shapes
: 
�
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_2IdentityTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_2:1*
_output_shapes
: *
T0
�
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_3IdentityTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_3:1*
T0*
_output_shapes

:#>
�
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_4IdentityTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_4:1*
_output_shapes

:#>*
T0
�
Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add/yConstS^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
Mmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/addAddRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/IdentityOmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add/y*
_output_shapes
: *
T0
�
[model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3TensorArrayReadV3amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/EnterTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1*
dtype0*
_output_shapes

:#
�
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/EnterEnterQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1*g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:*
T0*
is_constant(*
parallel_iterations 
�
cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1Enter~model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqualGreaterEqualTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1\model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqual/Enter*
T0*
_output_shapes
:#
�
\model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqual/EnterEnterOmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLen*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:#*
T0
�
ulstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shapeConst*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB"D   �   *
dtype0*
_output_shapes
:
�
slstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/minConst*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB
 *�*
dtype0*
_output_shapes
: 
�
slstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/maxConst*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB
 *>*
dtype0*
_output_shapes
: 
�
}lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniformRandomUniformulstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shape*
_output_shapes
:	D�*

seed *
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
seed2 *
dtype0
�
slstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/subSubslstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/maxslstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
_output_shapes
: *
T0
�
slstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mulMul}lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniformslstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/sub*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
_output_shapes
:	D�
�
olstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniformAddslstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mulslstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
_output_shapes
:	D�
�
Tlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel
VariableV2*
shape:	D�*
dtype0*
_output_shapes
:	D�*
shared_name *g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
	container 
�
[lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignAssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelolstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	D�
�
Ylstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/readIdentityTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
_output_shapes
:	D�*
T0
�
tlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/shape_as_tensorConst*
dtype0*
_output_shapes
:*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
valueB:�
�
jlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/ConstConst*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
valueB
 *    *
dtype0*
_output_shapes
: 
�
dlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zerosFilltlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/shape_as_tensorjlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/Const*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*

index_type0*
_output_shapes	
:�
�
Rlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias
VariableV2*
shared_name *e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
	container *
shape:�*
dtype0*
_output_shapes	
:�
�
Ylstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignAssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasdlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�*
use_locking(*
T0
�
Wlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/readIdentityRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
_output_shapes	
:�*
T0
�
_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/ConstConstS^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
emodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axisConstS^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concatConcatV2[model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_4emodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axis*

Tidx0*
T0*
N*
_output_shapes

:#D
�
`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMulMatMul`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concatfmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter*
T0*
transpose_a( *
_output_shapes
:	#�*
transpose_b( 
�
fmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/EnterEnterYlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read*
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:	D�*
T0*
is_constant(
�
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAddBiasAdd`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMulgmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter*
T0*
data_formatNHWC*
_output_shapes
:	#�
�
gmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/EnterEnterWlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/read*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes	
:�*
T0
�
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_1ConstS^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
�
_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/splitSplit_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Constamodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd*
T0*
	num_split*<
_output_shapes*
(:#>:#>:#>:#>
�
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2ConstS^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
valueB
 *  �?*
dtype0*
_output_shapes
: 
�
]model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/AddAddamodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:2amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2*
T0*
_output_shapes

:#>
�
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/SigmoidSigmoid]model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add*
_output_shapes

:#>*
T0
�
]model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MulMulTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_3amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid*
T0*
_output_shapes

:#>
�
cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1Sigmoid_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split*
_output_shapes

:#>*
T0
�
^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/TanhTanhamodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:1*
_output_shapes

:#>*
T0
�
_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1Mulcmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh*
T0*
_output_shapes

:#>
�
_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1Add]model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1*
T0*
_output_shapes

:#>
�
`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1Tanh_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*
T0*
_output_shapes

:#>
�
cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2Sigmoidamodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:3*
_output_shapes

:#>*
T0
�
_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2Mul`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2*
_output_shapes

:#>*
T0
�
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/SelectSelectVmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqualVmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select/Enter_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes

:#>*
T0*r
_classh
fdloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2
�
Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select/EnterEnterImodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zeros*r
_classh
fdloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
parallel_iterations *
is_constant(*
_output_shapes

:#>*g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
T0
�
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_1SelectVmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqualTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_3_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*
T0*r
_classh
fdloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*
_output_shapes

:#>
�
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_2SelectVmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqualTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_4_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
T0*r
_classh
fdloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes

:#>
�
mmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/SelectTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_2*
T0*r
_classh
fdloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes
: 
�
smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterOmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*
is_constant(*
_output_shapes
:*g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
T0*r
_classh
fdloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
parallel_iterations 
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1/yConstS^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1AddTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1/y*
T0*
_output_shapes
: 
�
Wmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIterationNextIterationMmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add*
_output_shapes
: *
T0
�
Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_1NextIterationOmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1*
T0*
_output_shapes
: 
�
Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_2NextIterationmmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
�
Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_3NextIterationRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_1*
T0*
_output_shapes

:#>
�
Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_4NextIterationRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_2*
T0*
_output_shapes

:#>
�
Nmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/ExitExitPmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch*
T0*
_output_shapes
: 
�
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_1ExitRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_1*
T0*
_output_shapes
: 
�
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_2ExitRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_2*
T0*
_output_shapes
: 
�
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_3ExitRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_3*
T0*
_output_shapes

:#>
�
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_4ExitRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_4*
_output_shapes

:#>*
T0
�
fmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayPmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_2*b
_classX
VTloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*
_output_shapes
: 
�
`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/range/startConst*b
_classX
VTloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*
value	B : *
dtype0*
_output_shapes
: 
�
`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/range/deltaConst*b
_classX
VTloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*
value	B :*
dtype0*
_output_shapes
: 
�
Zmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/rangeRange`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/range/startfmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/TensorArraySizeV3`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/range/delta*

Tidx0*b
_classX
VTloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*#
_output_shapes
:���������
�
hmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayZmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/rangePmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_2*
element_shape
:#>*b
_classX
VTloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*
dtype0*"
_output_shapes
:#>
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_5Const*
valueB"   #   *
dtype0*
_output_shapes
:
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_6Const*
_output_shapes
:*
valueB:>*
dtype0
�
\model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/ConstConst*
valueB:#*
dtype0*
_output_shapes
:
�
^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_1Const*
dtype0*
_output_shapes
:*
valueB:>
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
]model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concatConcatV2\model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_1bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
\model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zerosFill]model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concatbmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zeros/Const*
T0*

index_type0*
_output_shapes

:#>
�
^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_2Const*
valueB:#*
dtype0*
_output_shapes
:
�
^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_3Const*
valueB:>*
dtype0*
_output_shapes
:
�
^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_4Const*
dtype0*
_output_shapes
:*
valueB:#
�
^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_5Const*
valueB:>*
dtype0*
_output_shapes
:
�
dmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat_1ConcatV2^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_4^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_5dmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat_1/axis*
T0*
N*
_output_shapes
:*

Tidx0
�
dmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1Fill_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat_1dmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1/Const*
_output_shapes

:#>*
T0*

index_type0
�
^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_6Const*
valueB:#*
dtype0*
_output_shapes
:
�
^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_7Const*
dtype0*
_output_shapes
:*
valueB:>
�
Imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/Fill/dimsConst*
valueB:#*
dtype0*
_output_shapes
:
�
Jmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/Fill/valueConst*
dtype0*
_output_shapes
: *
value	B :
�
Dmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/FillFillImodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/Fill/dimsJmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/Fill/value*
T0*

index_type0*
_output_shapes
:#
�
Gmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ToInt64CastDmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/Fill*

DstT0	*
_output_shapes
:#*

SrcT0
�
Nmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2/axisConst*
valueB: *
dtype0*
_output_shapes
:
�
Imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2	ReverseV26model/lstm2d_2/horizontal_pass/Horizontal_LSTM/ReshapeNmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2/axis*"
_output_shapes
:#*

Tidx0*
T0
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/ToInt32CastGmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ToInt64*

SrcT0	*

DstT0*
_output_shapes
:#
�
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/sequence_lengthIdentityKmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/ToInt32*
T0*
_output_shapes
:#
�
`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/ConstConst*
valueB:#*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_1Const*
valueB:>*
dtype0*
_output_shapes
:
�
fmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
�
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concatConcatV2`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Constbmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_1fmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat/axis*
N*
_output_shapes
:*

Tidx0*
T0
�
fmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zerosFillamodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concatfmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros/Const*
_output_shapes

:#>*
T0*

index_type0
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_2Const*
valueB:#*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_3Const*
valueB:>*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_4Const*
valueB:#*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_5Const*
valueB:>*
dtype0*
_output_shapes
:
�
hmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1ConcatV2bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_4bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_5hmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1/axis*

Tidx0*
T0*
N*
_output_shapes
:
�
hmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1/ConstConst*
_output_shapes
: *
valueB
 *    *
dtype0
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1Fillcmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1hmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1/Const*
_output_shapes

:#>*
T0*

index_type0
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_6Const*
valueB:#*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_7Const*
dtype0*
_output_shapes
:*
valueB:>
�
Imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/ShapeConst*
valueB:#*
dtype0*
_output_shapes
:
�
Imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/stackConst*
valueB:#*
dtype0*
_output_shapes
:
�
Imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/EqualEqualImodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/ShapeImodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/stack*
_output_shapes
:*
T0
�
Imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
Gmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/AllAllImodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/EqualImodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const*
_output_shapes
: *
	keep_dims( *

Tidx0
�
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/ConstConst*�
value{By BsExpected shape for Tensor model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/sequence_length:0 is *
dtype0*
_output_shapes
: 
�
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Const_1Const*!
valueB B but saw shape: *
dtype0*
_output_shapes
: 
�
Xmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Assert/data_0Const*�
value{By BsExpected shape for Tensor model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/sequence_length:0 is *
dtype0*
_output_shapes
: 
�
Xmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Assert/data_2Const*!
valueB B but saw shape: *
dtype0*
_output_shapes
: 
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/AssertAssertGmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/AllXmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Assert/data_0Imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/stackXmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Assert/data_2Imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Shape*
T
2*
	summarize
�
Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLenIdentitySmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/sequence_lengthR^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Assert*
_output_shapes
:#*
T0
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Shape_1Const*!
valueB"   #      *
dtype0*
_output_shapes
:
�
Wmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_sliceStridedSliceKmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Shape_1Wmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stackYmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stack_1Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stack_2*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_1Const*
_output_shapes
:*
valueB:#*
dtype0
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_2Const*
valueB:>*
dtype0*
_output_shapes
:
�
Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
Jmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/concatConcatV2Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_1Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_2Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
�
Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zeros/ConstConst*
_output_shapes
: *
valueB
 *    *
dtype0
�
Imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zerosFillJmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/concatOmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zeros/Const*
T0*

index_type0*
_output_shapes

:#>
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_3Const*
valueB: *
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/MinMinOmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLenKmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_3*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_4Const*
valueB: *
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/MaxMaxOmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLenKmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_4*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
�
Hmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/timeConst*
value	B : *
dtype0*
_output_shapes
: 
�
Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayTensorArrayV3Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice*o
tensor_array_nameZXmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/dynamic_rnn/output_0*
dtype0*
_output_shapes

:: *
element_shape
:#>*
clear_after_read(*
dynamic_size( *
identical_element_shapes(
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1TensorArrayV3Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice*n
tensor_array_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/dynamic_rnn/input_0*
dtype0*
_output_shapes

:: *
element_shape
:#*
dynamic_size( *
clear_after_read(*
identical_element_shapes(
�
\model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/ShapeConst*
_output_shapes
:*!
valueB"   #      *
dtype0
�
jmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
lmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
lmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
dmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_sliceStridedSlice\model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/Shapejmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stacklmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_1lmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_2*
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask*
ellipsis_mask *

begin_mask 
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
�
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
\model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/rangeRangebmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/range/startdmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slicebmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/range/delta*#
_output_shapes
:���������*

Tidx0
�
~model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1\model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/rangeImodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1:1*\
_classR
PNloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2*
_output_shapes
: *
T0
�
Mmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Maximum/xConst*
value	B :*
dtype0*
_output_shapes
: 
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/MaximumMaximumMmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Maximum/xGmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Max*
T0*
_output_shapes
: 
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/MinimumMinimumQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_sliceKmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Maximum*
T0*
_output_shapes
: 
�
[model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/iteration_counterConst*
dtype0*
_output_shapes
: *
value	B : 
�
Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/EnterEnter[model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/iteration_counter*
T0*
is_constant( *
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_1EnterHmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/time*
T0*
is_constant( *
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_2EnterQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray:1*
T0*
is_constant( *
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_3Enter`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros*
T0*
is_constant( *
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes

:#>
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_4Enterbmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1*
T0*
is_constant( *
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes

:#>
�
Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/MergeMergeOmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/EnterWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration*
N*
_output_shapes
: : *
T0
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1MergeQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_1Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_1*
_output_shapes
: : *
T0*
N
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_2MergeQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_2Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_2*
_output_shapes
: : *
T0*
N
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_3MergeQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_3Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_3*
T0*
N* 
_output_shapes
:#>: 
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_4MergeQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_4Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_4*
T0*
N* 
_output_shapes
:#>: 
�
Nmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LessLessOmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/MergeTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less/Enter*
T0*
_output_shapes
: 
�
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less/EnterEnterQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice*
T0*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1LessQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1/Enter*
T0*
_output_shapes
: 
�
Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1/EnterEnterKmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Minimum*
T0*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LogicalAnd
LogicalAndNmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LessPmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1*
_output_shapes
: 
�
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCondLoopCondTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LogicalAnd*
_output_shapes
: 
�
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/SwitchSwitchOmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/MergeRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond*b
_classX
VTloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge*
_output_shapes
: : *
T0
�
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_1SwitchQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond*
T0*d
_classZ
XVloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1*
_output_shapes
: : 
�
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_2SwitchQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_2Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond*
_output_shapes
: : *
T0*d
_classZ
XVloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_2
�
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_3SwitchQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_3Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond*(
_output_shapes
:#>:#>*
T0*d
_classZ
XVloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_3
�
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_4SwitchQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_4Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond*
T0*d
_classZ
XVloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_4*(
_output_shapes
:#>:#>
�
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/IdentityIdentityRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch:1*
T0*
_output_shapes
: 
�
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1IdentityTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_1:1*
T0*
_output_shapes
: 
�
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_2IdentityTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_2:1*
_output_shapes
: *
T0
�
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_3IdentityTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_3:1*
_output_shapes

:#>*
T0
�
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_4IdentityTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_4:1*
T0*
_output_shapes

:#>
�
Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add/yConstS^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
Mmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/addAddRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/IdentityOmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add/y*
T0*
_output_shapes
: 
�
[model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3TensorArrayReadV3amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/EnterTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1*
dtype0*
_output_shapes

:#
�
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/EnterEnterQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:*
T0
�
cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1Enter~model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
is_constant(*
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqualGreaterEqualTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1\model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqual/Enter*
_output_shapes
:#*
T0
�
\model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqual/EnterEnterOmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLen*
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:#*
T0*
is_constant(
�
ulstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shapeConst*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB"D   �   *
dtype0*
_output_shapes
:
�
slstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/minConst*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB
 *�*
dtype0*
_output_shapes
: 
�
slstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB
 *>*
dtype0
�
}lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniformRandomUniformulstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shape*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
seed2 *
dtype0*
_output_shapes
:	D�*

seed 
�
slstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/subSubslstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/maxslstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
_output_shapes
: 
�
slstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mulMul}lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniformslstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/sub*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
_output_shapes
:	D�*
T0
�
olstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniformAddslstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mulslstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
_output_shapes
:	D�
�
Tlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel
VariableV2*
shape:	D�*
dtype0*
_output_shapes
:	D�*
shared_name *g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
	container 
�
[lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignAssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelolstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform*
validate_shape(*
_output_shapes
:	D�*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
Ylstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/readIdentityTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
_output_shapes
:	D�*
T0
�
tlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/shape_as_tensorConst*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
valueB:�*
dtype0*
_output_shapes
:
�
jlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/ConstConst*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
valueB
 *    *
dtype0*
_output_shapes
: 
�
dlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zerosFilltlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/shape_as_tensorjlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/Const*
_output_shapes	
:�*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*

index_type0
�
Rlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias
VariableV2*
dtype0*
_output_shapes	
:�*
shared_name *e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
	container *
shape:�
�
Ylstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignAssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasdlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
Wlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/readIdentityRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
_output_shapes	
:�*
T0
�
_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/ConstConstS^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
emodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axisConstS^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concatConcatV2[model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_4emodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axis*
_output_shapes

:#D*

Tidx0*
T0*
N
�
`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMulMatMul`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concatfmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter*
T0*
transpose_a( *
_output_shapes
:	#�*
transpose_b( 
�
fmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/EnterEnterYlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read*g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:	D�*
T0*
is_constant(*
parallel_iterations 
�
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAddBiasAdd`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMulgmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter*
T0*
data_formatNHWC*
_output_shapes
:	#�
�
gmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/EnterEnterWlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/read*
parallel_iterations *g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes	
:�*
T0*
is_constant(
�
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_1ConstS^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/splitSplit_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Constamodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd*
T0*
	num_split*<
_output_shapes*
(:#>:#>:#>:#>
�
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2ConstS^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
]model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/AddAddamodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:2amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2*
_output_shapes

:#>*
T0
�
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/SigmoidSigmoid]model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add*
_output_shapes

:#>*
T0
�
]model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MulMulTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_3amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid*
T0*
_output_shapes

:#>
�
cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1Sigmoid_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split*
T0*
_output_shapes

:#>
�
^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/TanhTanhamodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:1*
T0*
_output_shapes

:#>
�
_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1Mulcmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh*
_output_shapes

:#>*
T0
�
_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1Add]model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1*
T0*
_output_shapes

:#>
�
`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1Tanh_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*
_output_shapes

:#>*
T0
�
cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2Sigmoidamodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:3*
_output_shapes

:#>*
T0
�
_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2Mul`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2*
T0*
_output_shapes

:#>
�
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/SelectSelectVmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqualVmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select/Enter_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
T0*r
_classh
fdloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes

:#>
�
Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select/EnterEnterImodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zeros*
T0*r
_classh
fdloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
parallel_iterations *
is_constant(*g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes

:#>
�
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_1SelectVmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqualTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_3_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*
T0*r
_classh
fdloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*
_output_shapes

:#>
�
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_2SelectVmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqualTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_4_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
T0*r
_classh
fdloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes

:#>
�
mmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/SelectTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_2*
_output_shapes
: *
T0*r
_classh
fdloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2
�
smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterOmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*
parallel_iterations *
is_constant(*g

frame_nameYWmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:*
T0*r
_classh
fdloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2
�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1/yConstS^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1AddTmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1/y*
_output_shapes
: *
T0
�
Wmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIterationNextIterationMmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add*
_output_shapes
: *
T0
�
Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_1NextIterationOmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1*
T0*
_output_shapes
: 
�
Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_2NextIterationmmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
�
Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_3NextIterationRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_1*
_output_shapes

:#>*
T0
�
Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_4NextIterationRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_2*
T0*
_output_shapes

:#>
�
Nmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/ExitExitPmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch*
T0*
_output_shapes
: 
�
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_1ExitRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_1*
T0*
_output_shapes
: 
�
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_2ExitRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_2*
T0*
_output_shapes
: 
�
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_3ExitRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_3*
T0*
_output_shapes

:#>
�
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_4ExitRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_4*
T0*
_output_shapes

:#>
�
fmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayPmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_2*
_output_shapes
: *b
_classX
VTloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray
�
`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/range/startConst*b
_classX
VTloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*
value	B : *
dtype0*
_output_shapes
: 
�
`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/range/deltaConst*b
_classX
VTloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*
value	B :*
dtype0*
_output_shapes
: 
�
Zmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/rangeRange`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/range/startfmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/TensorArraySizeV3`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/range/delta*b
_classX
VTloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*#
_output_shapes
:���������*

Tidx0
�
hmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayZmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/rangePmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_2*
element_shape
:#>*b
_classX
VTloc:@model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*
dtype0*"
_output_shapes
:#>
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_5Const*
valueB"   #   *
dtype0*
_output_shapes
:
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_6Const*
valueB:>*
dtype0*
_output_shapes
:
�
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2_1/axisConst*
valueB: *
dtype0*
_output_shapes
:
�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2_1	ReverseV2hmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/TensorArrayGatherV3Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2_1/axis*"
_output_shapes
:#>*

Tidx0*
T0
|
:model/lstm2d_2/horizontal_pass/Horizontal_LSTM/concat/axisConst*
value	B :*
dtype0*
_output_shapes
: 
�
5model/lstm2d_2/horizontal_pass/Horizontal_LSTM/concatConcatV2hmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/TensorArrayGatherV3Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2_1:model/lstm2d_2/horizontal_pass/Horizontal_LSTM/concat/axis*
N*"
_output_shapes
:#|*

Tidx0*
T0
�
>model/lstm2d_2/horizontal_pass/Horizontal_LSTM/Reshape_1/shapeConst*%
valueB"   #      |   *
dtype0*
_output_shapes
:
�
8model/lstm2d_2/horizontal_pass/Horizontal_LSTM/Reshape_1Reshape5model/lstm2d_2/horizontal_pass/Horizontal_LSTM/concat>model/lstm2d_2/horizontal_pass/Horizontal_LSTM/Reshape_1/shape*
T0*
Tshape0*&
_output_shapes
:#|
�
?model/lstm2d_2/horizontal_pass/Horizontal_LSTM/transpose_1/permConst*
dtype0*
_output_shapes
:*%
valueB"             
�
:model/lstm2d_2/horizontal_pass/Horizontal_LSTM/transpose_1	Transpose8model/lstm2d_2/horizontal_pass/Horizontal_LSTM/Reshape_1?model/lstm2d_2/horizontal_pass/Horizontal_LSTM/transpose_1/perm*
T0*&
_output_shapes
:#|*
Tperm0
�
+model/lstm2d_2/vertical_pass/transpose/permConst*
_output_shapes
:*%
valueB"             *
dtype0
�
&model/lstm2d_2/vertical_pass/transpose	Transpose:model/lstm2d_2/horizontal_pass/Horizontal_LSTM/transpose_1+model/lstm2d_2/vertical_pass/transpose/perm*
T0*&
_output_shapes
:#|*
Tperm0
�
;model/lstm2d_2/vertical_pass/Horizontal_LSTM/transpose/permConst*%
valueB"             *
dtype0*
_output_shapes
:
�
6model/lstm2d_2/vertical_pass/Horizontal_LSTM/transpose	Transpose&model/lstm2d_2/vertical_pass/transpose;model/lstm2d_2/vertical_pass/Horizontal_LSTM/transpose/perm*&
_output_shapes
:#|*
Tperm0*
T0
�
:model/lstm2d_2/vertical_pass/Horizontal_LSTM/Reshape/shapeConst*!
valueB"   �  |   *
dtype0*
_output_shapes
:
�
4model/lstm2d_2/vertical_pass/Horizontal_LSTM/ReshapeReshape6model/lstm2d_2/vertical_pass/Horizontal_LSTM/transpose:model/lstm2d_2/vertical_pass/Horizontal_LSTM/Reshape/shape*
T0*
Tshape0*#
_output_shapes
:�|
�
Zmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/ConstConst*
_output_shapes
:*
valueB:�*
dtype0
�
\model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_1Const*
valueB:>*
dtype0*
_output_shapes
:
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
[model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concatConcatV2Zmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const\model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_1`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat/axis*

Tidx0*
T0*
N*
_output_shapes
:
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
Zmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zerosFill[model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zeros/Const*
_output_shapes
:	�>*
T0*

index_type0
�
\model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_2Const*
valueB:�*
dtype0*
_output_shapes
:
�
\model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_3Const*
valueB:>*
dtype0*
_output_shapes
:
�
\model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_4Const*
valueB:�*
dtype0*
_output_shapes
:
�
\model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_5Const*
valueB:>*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
]model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat_1ConcatV2\model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_4\model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_5bmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat_1/axis*
T0*
N*
_output_shapes
:*

Tidx0
�
bmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
\model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1Fill]model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/concat_1bmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1/Const*
T0*

index_type0*
_output_shapes
:	�>
�
\model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_6Const*
valueB:�*
dtype0*
_output_shapes
:
�
\model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/BasicLSTMCellZeroState/Const_7Const*
valueB:>*
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/Fill/dimsConst*
valueB:�*
dtype0*
_output_shapes
:
�
Hmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/Fill/valueConst*
value	B :*
dtype0*
_output_shapes
: 
�
Bmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/FillFillGmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/Fill/dimsHmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/Fill/value*
_output_shapes	
:�*
T0*

index_type0
�
Emodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/ToInt64CastBmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/Fill*

SrcT0*

DstT0	*
_output_shapes	
:�
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/ToInt32CastEmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/ToInt64*

SrcT0	*

DstT0*
_output_shapes	
:�
�
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/sequence_lengthIdentityImodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/ToInt32*
T0*
_output_shapes	
:�
�
^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/ConstConst*
_output_shapes
:*
valueB:�*
dtype0
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_1Const*
valueB:>*
dtype0*
_output_shapes
:
�
dmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concatConcatV2^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_1dmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat/axis*
N*
_output_shapes
:*

Tidx0*
T0
�
dmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zerosFill_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concatdmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros/Const*
T0*

index_type0*
_output_shapes
:	�>
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_2Const*
dtype0*
_output_shapes
:*
valueB:�
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_3Const*
valueB:>*
dtype0*
_output_shapes
:
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_4Const*
valueB:�*
dtype0*
_output_shapes
:
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_5Const*
valueB:>*
dtype0*
_output_shapes
:
�
fmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1ConcatV2`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_4`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_5fmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1/axis*
_output_shapes
:*

Tidx0*
T0*
N
�
fmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1Fillamodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1fmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1/Const*
T0*

index_type0*
_output_shapes
:	�>
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_6Const*
valueB:�*
dtype0*
_output_shapes
:
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_7Const*
valueB:>*
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/ShapeConst*
valueB:�*
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/stackConst*
dtype0*
_output_shapes
:*
valueB:�
�
Gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/EqualEqualGmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/ShapeGmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/stack*
T0*
_output_shapes
:
�
Gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/ConstConst*
_output_shapes
:*
valueB: *
dtype0
�
Emodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/AllAllGmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/EqualGmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const*
_output_shapes
: *
	keep_dims( *

Tidx0
�
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/ConstConst*�
valueyBw BqExpected shape for Tensor model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/sequence_length:0 is *
dtype0*
_output_shapes
: 
�
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Const_1Const*!
valueB B but saw shape: *
dtype0*
_output_shapes
: 
�
Vmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Assert/data_0Const*
dtype0*
_output_shapes
: *�
valueyBw BqExpected shape for Tensor model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/sequence_length:0 is 
�
Vmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Assert/data_2Const*!
valueB B but saw shape: *
dtype0*
_output_shapes
: 
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/AssertAssertEmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/AllVmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Assert/data_0Gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/stackVmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Assert/data_2Gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Shape*
T
2*
	summarize
�
Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLenIdentityQmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/sequence_lengthP^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Assert/Assert*
T0*
_output_shapes	
:�
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Shape_1Const*!
valueB"   �  |   *
dtype0*
_output_shapes
:
�
Umodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_sliceStridedSliceImodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Shape_1Umodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stackWmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stack_1Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_1Const*
valueB:�*
dtype0*
_output_shapes
:
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_2Const*
_output_shapes
:*
valueB:>*
dtype0
�
Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
Hmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/concatConcatV2Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_1Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_2Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/concat/axis*

Tidx0*
T0*
N*
_output_shapes
:
�
Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
Gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zerosFillHmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/concatMmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zeros/Const*
T0*

index_type0*
_output_shapes
:	�>
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_3Const*
_output_shapes
:*
valueB: *
dtype0
�
Emodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/MinMinMmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLenImodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_3*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_4Const*
valueB: *
dtype0*
_output_shapes
:
�
Emodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/MaxMaxMmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLenImodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_4*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
�
Fmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/timeConst*
value	B : *
dtype0*
_output_shapes
: 
�
Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayTensorArrayV3Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice*
clear_after_read(*
dynamic_size( *
identical_element_shapes(*m
tensor_array_nameXVmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/dynamic_rnn/output_0*
dtype0*
_output_shapes

:: *
element_shape:	�>
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1TensorArrayV3Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice*l
tensor_array_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/dynamic_rnn/input_0*
dtype0*
_output_shapes

:: *
element_shape:	�|*
clear_after_read(*
dynamic_size( *
identical_element_shapes(
�
Zmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/ShapeConst*!
valueB"   �  |   *
dtype0*
_output_shapes
:
�
hmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
jmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
jmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_sliceStridedSliceZmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/Shapehmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stackjmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_1jmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_2*
_output_shapes
: *
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
�
Zmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/rangeRange`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/range/startbmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/range/delta*#
_output_shapes
:���������*

Tidx0
�
|model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1Zmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/range4model/lstm2d_2/vertical_pass/Horizontal_LSTM/ReshapeQmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1:1*
T0*G
_class=
;9loc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/Reshape*
_output_shapes
: 
�
Kmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Maximum/xConst*
value	B :*
dtype0*
_output_shapes
: 
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/MaximumMaximumKmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Maximum/xEmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Max*
_output_shapes
: *
T0
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/MinimumMinimumOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_sliceImodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Maximum*
T0*
_output_shapes
: 
�
Ymodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/iteration_counterConst*
value	B : *
dtype0*
_output_shapes
: 
�
Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/EnterEnterYmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/iteration_counter*
T0*
is_constant( *
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_1EnterFmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/time*
T0*
is_constant( *
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_2EnterOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray:1*
T0*
is_constant( *
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_3Enter^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros*
is_constant( *
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:	�>*
T0
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_4Enter`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1*
is_constant( *
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:	�>*
T0
�
Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/MergeMergeMmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/EnterUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration*
T0*
N*
_output_shapes
: : 
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1MergeOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_1Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_1*
T0*
N*
_output_shapes
: : 
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_2MergeOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_2Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_2*
T0*
N*
_output_shapes
: : 
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_3MergeOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_3Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_3*
T0*
N*!
_output_shapes
:	�>: 
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_4MergeOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_4Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_4*
T0*
N*!
_output_shapes
:	�>: 
�
Lmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LessLessMmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/MergeRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less/Enter*
T0*
_output_shapes
: 
�
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less/EnterEnterOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice*
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: *
T0*
is_constant(
�
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1LessOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1/Enter*
T0*
_output_shapes
: 
�
Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1/EnterEnterImodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Minimum*
T0*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LogicalAnd
LogicalAndLmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LessNmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1*
_output_shapes
: 
�
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCondLoopCondRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LogicalAnd*
_output_shapes
: 
�
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/SwitchSwitchMmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/MergePmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond*
T0*`
_classV
TRloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge*
_output_shapes
: : 
�
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_1SwitchOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond*
T0*b
_classX
VTloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1*
_output_shapes
: : 
�
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_2SwitchOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_2Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond*b
_classX
VTloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_2*
_output_shapes
: : *
T0
�
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_3SwitchOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_3Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond**
_output_shapes
:	�>:	�>*
T0*b
_classX
VTloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_3
�
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_4SwitchOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_4Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond*
T0*b
_classX
VTloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_4**
_output_shapes
:	�>:	�>
�
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/IdentityIdentityPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch:1*
T0*
_output_shapes
: 
�
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1IdentityRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_1:1*
_output_shapes
: *
T0
�
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_2IdentityRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_2:1*
_output_shapes
: *
T0
�
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_3IdentityRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_3:1*
_output_shapes
:	�>*
T0
�
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_4IdentityRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_4:1*
_output_shapes
:	�>*
T0
�
Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add/yConstQ^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
Kmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/addAddPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/IdentityMmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add/y*
T0*
_output_shapes
: 
�
Ymodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3TensorArrayReadV3_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/EnterRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1*
dtype0*
_output_shapes
:	�|
�
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/EnterEnterOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1*
T0*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:
�
amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1Enter|model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqualGreaterEqualRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1Zmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqual/Enter*
T0*
_output_shapes	
:�
�
Zmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqual/EnterEnterMmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLen*e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes	
:�*
T0*
is_constant(*
parallel_iterations 
�
slstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shapeConst*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB"�   �   *
dtype0*
_output_shapes
:
�
qlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/minConst*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB
 *g��*
dtype0*
_output_shapes
: 
�
qlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/maxConst*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB
 *g��=*
dtype0*
_output_shapes
: 
�
{lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniformRandomUniformslstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shape*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
seed2 *
dtype0* 
_output_shapes
:
��*

seed 
�
qlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/subSubqlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/maxqlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
_output_shapes
: *
T0
�
qlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mulMul{lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniformqlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/sub* 
_output_shapes
:
��*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
mlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniformAddqlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mulqlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel* 
_output_shapes
:
��
�
Rlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel
VariableV2*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
	container *
shape:
��*
dtype0* 
_output_shapes
:
��*
shared_name 
�
Ylstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignAssignRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelmlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(* 
_output_shapes
:
��*
use_locking(*
T0
�
Wlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/readIdentityRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel* 
_output_shapes
:
��*
T0
�
rlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/shape_as_tensorConst*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
valueB:�*
dtype0*
_output_shapes
:
�
hlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/ConstConst*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
valueB
 *    *
dtype0*
_output_shapes
: 
�
blstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zerosFillrlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/shape_as_tensorhlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/Const*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*

index_type0*
_output_shapes	
:�*
T0
�
Plstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias
VariableV2*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
	container *
shape:�*
dtype0*
_output_shapes	
:�*
shared_name 
�
Wlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignAssignPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasblstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros*
_output_shapes	
:�*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(
�
Ulstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/readIdentityPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
T0*
_output_shapes	
:�
�
]model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/ConstConstQ^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
cmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axisConstQ^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
�
^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concatConcatV2Ymodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_4cmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axis*

Tidx0*
T0*
N* 
_output_shapes
:
��
�
^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMulMatMul^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concatdmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter*
T0*
transpose_a( * 
_output_shapes
:
��*
transpose_b( 
�
dmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/EnterEnterWlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read*
T0*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context* 
_output_shapes
:
��
�
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAddBiasAdd^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMulemodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter*
T0*
data_formatNHWC* 
_output_shapes
:
��
�
emodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/EnterEnterUlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/read*
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes	
:�*
T0*
is_constant(
�
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_1ConstQ^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
]model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/splitSplit]model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd*
T0*
	num_split*@
_output_shapes.
,:	�>:	�>:	�>:	�>
�
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2ConstQ^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
[model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/AddAdd_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:2_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2*
_output_shapes
:	�>*
T0
�
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/SigmoidSigmoid[model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add*
T0*
_output_shapes
:	�>
�
[model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MulMulRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_3_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid*
_output_shapes
:	�>*
T0
�
amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1Sigmoid]model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split*
T0*
_output_shapes
:	�>
�
\model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/TanhTanh_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:1*
T0*
_output_shapes
:	�>
�
]model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1Mulamodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1\model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh*
T0*
_output_shapes
:	�>
�
]model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1Add[model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul]model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1*
T0*
_output_shapes
:	�>
�
^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1Tanh]model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*
_output_shapes
:	�>*
T0
�
amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2Sigmoid_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:3*
T0*
_output_shapes
:	�>
�
]model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2Mul^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2*
_output_shapes
:	�>*
T0
�
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/SelectSelectTmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqualTmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select/Enter]model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
T0*p
_classf
dbloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes
:	�>
�
Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select/EnterEnterGmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zeros*
T0*p
_classf
dbloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
parallel_iterations *
is_constant(*
_output_shapes
:	�>*e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context
�
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_1SelectTmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqualRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_3]model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*p
_classf
dbloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*
_output_shapes
:	�>*
T0
�
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_2SelectTmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqualRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_4]model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
T0*p
_classf
dbloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes
:	�>
�
kmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/SelectRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_2*
T0*p
_classf
dbloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes
: 
�
qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterMmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*
is_constant(*e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:*
T0*p
_classf
dbloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
parallel_iterations 
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1/yConstQ^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1AddRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1/y*
_output_shapes
: *
T0
�
Umodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIterationNextIterationKmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add*
_output_shapes
: *
T0
�
Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_1NextIterationMmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1*
_output_shapes
: *
T0
�
Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_2NextIterationkmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
�
Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_3NextIterationPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_1*
T0*
_output_shapes
:	�>
�
Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_4NextIterationPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_2*
T0*
_output_shapes
:	�>
�
Lmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/ExitExitNmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch*
_output_shapes
: *
T0
�
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_1ExitPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_1*
_output_shapes
: *
T0
�
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_2ExitPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_2*
T0*
_output_shapes
: 
�
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_3ExitPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_3*
_output_shapes
:	�>*
T0
�
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_4ExitPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_4*
T0*
_output_shapes
:	�>
�
dmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayNmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_2*`
_classV
TRloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*
_output_shapes
: 
�
^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/range/startConst*`
_classV
TRloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*
value	B : *
dtype0*
_output_shapes
: 
�
^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/range/deltaConst*`
_classV
TRloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*
value	B :*
dtype0*
_output_shapes
: 
�
Xmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/rangeRange^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/range/startdmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/TensorArraySizeV3^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/range/delta*

Tidx0*`
_classV
TRloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*#
_output_shapes
:���������
�
fmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayXmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/rangeNmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_2*#
_output_shapes
:�>*
element_shape:	�>*`
_classV
TRloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray*
dtype0
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_5Const*
valueB"   �  *
dtype0*
_output_shapes
:
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Const_6Const*
valueB:>*
dtype0*
_output_shapes
:
�
Zmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/ConstConst*
valueB:�*
dtype0*
_output_shapes
:
�
\model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_1Const*
valueB:>*
dtype0*
_output_shapes
:
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
[model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concatConcatV2Zmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const\model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_1`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat/axis*
N*
_output_shapes
:*

Tidx0*
T0
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
Zmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zerosFill[model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zeros/Const*
T0*

index_type0*
_output_shapes
:	�>
�
\model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_2Const*
dtype0*
_output_shapes
:*
valueB:�
�
\model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_3Const*
valueB:>*
dtype0*
_output_shapes
:
�
\model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_4Const*
valueB:�*
dtype0*
_output_shapes
:
�
\model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_5Const*
valueB:>*
dtype0*
_output_shapes
:
�
bmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
]model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat_1ConcatV2\model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_4\model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_5bmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat_1/axis*
T0*
N*
_output_shapes
:*

Tidx0
�
bmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1/ConstConst*
_output_shapes
: *
valueB
 *    *
dtype0
�
\model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1Fill]model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/concat_1bmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/zeros_1/Const*

index_type0*
_output_shapes
:	�>*
T0
�
\model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_6Const*
valueB:�*
dtype0*
_output_shapes
:
�
\model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/BasicLSTMCellZeroState/Const_7Const*
valueB:>*
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/Fill/dimsConst*
valueB:�*
dtype0*
_output_shapes
:
�
Hmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/Fill/valueConst*
value	B :*
dtype0*
_output_shapes
: 
�
Bmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/FillFillGmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/Fill/dimsHmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/Fill/value*
T0*

index_type0*
_output_shapes	
:�
�
Emodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ToInt64CastBmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/Fill*

SrcT0*

DstT0	*
_output_shapes	
:�
�
Lmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2/axisConst*
valueB: *
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2	ReverseV24model/lstm2d_2/vertical_pass/Horizontal_LSTM/ReshapeLmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2/axis*

Tidx0*
T0*#
_output_shapes
:�|
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/ToInt32CastEmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ToInt64*

SrcT0	*

DstT0*
_output_shapes	
:�
�
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/sequence_lengthIdentityImodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/ToInt32*
T0*
_output_shapes	
:�
�
^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/ConstConst*
valueB:�*
dtype0*
_output_shapes
:
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_1Const*
valueB:>*
dtype0*
_output_shapes
:
�
dmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concatConcatV2^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_1dmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat/axis*
N*
_output_shapes
:*

Tidx0*
T0
�
dmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zerosFill_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concatdmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros/Const*
_output_shapes
:	�>*
T0*

index_type0
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_2Const*
_output_shapes
:*
valueB:�*
dtype0
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_3Const*
dtype0*
_output_shapes
:*
valueB:>
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_4Const*
valueB:�*
dtype0*
_output_shapes
:
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_5Const*
valueB:>*
dtype0*
_output_shapes
:
�
fmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1ConcatV2`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_4`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_5fmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1/axis*

Tidx0*
T0*
N*
_output_shapes
:
�
fmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1Fillamodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/concat_1fmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1/Const*
T0*

index_type0*
_output_shapes
:	�>
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_6Const*
valueB:�*
dtype0*
_output_shapes
:
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/Const_7Const*
valueB:>*
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/ShapeConst*
valueB:�*
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/stackConst*
valueB:�*
dtype0*
_output_shapes
:
�
Gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/EqualEqualGmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/ShapeGmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/stack*
T0*
_output_shapes
:
�
Gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
Emodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/AllAllGmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/EqualGmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const*
_output_shapes
: *
	keep_dims( *

Tidx0
�
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/ConstConst*�
valueyBw BqExpected shape for Tensor model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/sequence_length:0 is *
dtype0*
_output_shapes
: 
�
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Const_1Const*!
valueB B but saw shape: *
dtype0*
_output_shapes
: 
�
Vmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Assert/data_0Const*�
valueyBw BqExpected shape for Tensor model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/sequence_length:0 is *
dtype0*
_output_shapes
: 
�
Vmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Assert/data_2Const*!
valueB B but saw shape: *
dtype0*
_output_shapes
: 
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/AssertAssertEmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/AllVmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Assert/data_0Gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/stackVmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Assert/data_2Gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Shape*
T
2*
	summarize
�
Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLenIdentityQmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/sequence_lengthP^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Assert/Assert*
T0*
_output_shapes	
:�
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Shape_1Const*!
valueB"   �  |   *
dtype0*
_output_shapes
:
�
Umodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
�
Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_sliceStridedSliceImodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Shape_1Umodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stackWmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stack_1Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_1Const*
valueB:�*
dtype0*
_output_shapes
:
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_2Const*
_output_shapes
:*
valueB:>*
dtype0
�
Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
Hmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/concatConcatV2Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_1Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_2Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
�
Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
�
Gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zerosFillHmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/concatMmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zeros/Const*
_output_shapes
:	�>*
T0*

index_type0
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_3Const*
valueB: *
dtype0*
_output_shapes
:
�
Emodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/MinMinMmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLenImodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_3*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_4Const*
valueB: *
dtype0*
_output_shapes
:
�
Emodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/MaxMaxMmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLenImodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_4*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
�
Fmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/timeConst*
value	B : *
dtype0*
_output_shapes
: 
�
Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayTensorArrayV3Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice*
element_shape:	�>*
dynamic_size( *
clear_after_read(*
identical_element_shapes(*m
tensor_array_nameXVmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/dynamic_rnn/output_0*
dtype0*
_output_shapes

:: 
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1TensorArrayV3Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice*
element_shape:	�|*
clear_after_read(*
dynamic_size( *
identical_element_shapes(*l
tensor_array_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/dynamic_rnn/input_0*
dtype0*
_output_shapes

:: 
�
Zmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/ShapeConst*!
valueB"   �  |   *
dtype0*
_output_shapes
:
�
hmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
jmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
jmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
�
bmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_sliceStridedSliceZmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/Shapehmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stackjmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_1jmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
�
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
�
Zmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/rangeRange`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/range/startbmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/strided_slice`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/range/delta*#
_output_shapes
:���������*

Tidx0
�
|model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1Zmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/rangeGmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1:1*
T0*Z
_classP
NLloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2*
_output_shapes
: 
�
Kmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Maximum/xConst*
value	B :*
dtype0*
_output_shapes
: 
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/MaximumMaximumKmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Maximum/xEmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Max*
T0*
_output_shapes
: 
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/MinimumMinimumOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_sliceImodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Maximum*
_output_shapes
: *
T0
�
Ymodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/iteration_counterConst*
_output_shapes
: *
value	B : *
dtype0
�
Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/EnterEnterYmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/iteration_counter*
T0*
is_constant( *
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_1EnterFmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/time*
T0*
is_constant( *
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_2EnterOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray:1*
T0*
is_constant( *
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_3Enter^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros*
T0*
is_constant( *
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:	�>
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_4Enter`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/BasicLSTMCellZeroState/zeros_1*e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:	�>*
T0*
is_constant( *
parallel_iterations 
�
Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/MergeMergeMmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/EnterUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration*
T0*
N*
_output_shapes
: : 
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1MergeOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_1Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_1*
N*
_output_shapes
: : *
T0
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_2MergeOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_2Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_2*
T0*
N*
_output_shapes
: : 
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_3MergeOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_3Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_3*
T0*
N*!
_output_shapes
:	�>: 
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_4MergeOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_4Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_4*
T0*
N*!
_output_shapes
:	�>: 
�
Lmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LessLessMmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/MergeRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less/Enter*
T0*
_output_shapes
: 
�
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less/EnterEnterOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice*
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: *
T0*
is_constant(
�
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1LessOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1/Enter*
T0*
_output_shapes
: 
�
Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1/EnterEnterImodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Minimum*e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: *
T0*
is_constant(*
parallel_iterations 
�
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LogicalAnd
LogicalAndLmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LessNmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1*
_output_shapes
: 
�
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCondLoopCondRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LogicalAnd*
_output_shapes
: 
�
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/SwitchSwitchMmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/MergePmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond*
_output_shapes
: : *
T0*`
_classV
TRloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge
�
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_1SwitchOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond*
_output_shapes
: : *
T0*b
_classX
VTloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1
�
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_2SwitchOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_2Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond*
_output_shapes
: : *
T0*b
_classX
VTloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_2
�
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_3SwitchOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_3Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond*
T0*b
_classX
VTloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_3**
_output_shapes
:	�>:	�>
�
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_4SwitchOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_4Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond*
T0*b
_classX
VTloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_4**
_output_shapes
:	�>:	�>
�
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/IdentityIdentityPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch:1*
T0*
_output_shapes
: 
�
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1IdentityRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_1:1*
T0*
_output_shapes
: 
�
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_2IdentityRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_2:1*
T0*
_output_shapes
: 
�
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_3IdentityRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_3:1*
T0*
_output_shapes
:	�>
�
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_4IdentityRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_4:1*
_output_shapes
:	�>*
T0
�
Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add/yConstQ^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
Kmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/addAddPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/IdentityMmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add/y*
T0*
_output_shapes
: 
�
Ymodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3TensorArrayReadV3_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/EnterRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1*
_output_shapes
:	�|*
dtype0
�
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/EnterEnterOmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
:*
T0
�
amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1Enter|model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes
: 
�
Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqualGreaterEqualRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1Zmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqual/Enter*
T0*
_output_shapes	
:�
�
Zmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqual/EnterEnterMmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLen*
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes	
:�*
T0*
is_constant(
�
slstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shapeConst*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB"�   �   *
dtype0*
_output_shapes
:
�
qlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/minConst*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB
 *g��*
dtype0*
_output_shapes
: 
�
qlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
valueB
 *g��=*
dtype0
�
{lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniformRandomUniformslstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shape*
dtype0* 
_output_shapes
:
��*

seed *
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
seed2 
�
qlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/subSubqlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/maxqlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
_output_shapes
: 
�
qlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mulMul{lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniformqlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/sub*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel* 
_output_shapes
:
��
�
mlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniformAddqlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mulqlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel* 
_output_shapes
:
��*
T0
�
Rlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel
VariableV2*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
	container *
shape:
��*
dtype0* 
_output_shapes
:
��*
shared_name 
�
Ylstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignAssignRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelmlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(* 
_output_shapes
:
��*
use_locking(
�
Wlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/readIdentityRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
T0* 
_output_shapes
:
��
�
rlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/shape_as_tensorConst*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
valueB:�*
dtype0*
_output_shapes
:
�
hlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/ConstConst*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
valueB
 *    *
dtype0*
_output_shapes
: 
�
blstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zerosFillrlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/shape_as_tensorhlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros/Const*
T0*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*

index_type0*
_output_shapes	
:�
�
Plstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias
VariableV2*
shared_name *c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
	container *
shape:�*
dtype0*
_output_shapes	
:�
�
Wlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignAssignPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasblstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�*
use_locking(*
T0
�
Ulstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/readIdentityPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
T0*
_output_shapes	
:�
�
]model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/ConstConstQ^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
cmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axisConstQ^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
dtype0*
_output_shapes
: *
value	B :
�
^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concatConcatV2Ymodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_4cmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axis*
T0*
N* 
_output_shapes
:
��*

Tidx0
�
^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMulMatMul^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concatdmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter*
transpose_a( * 
_output_shapes
:
��*
transpose_b( *
T0
�
dmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/EnterEnterWlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read*
T0*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context* 
_output_shapes
:
��
�
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAddBiasAdd^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMulemodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter* 
_output_shapes
:
��*
T0*
data_formatNHWC
�
emodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/EnterEnterUlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/read*
is_constant(*
parallel_iterations *e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
_output_shapes	
:�*
T0
�
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_1ConstQ^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
dtype0*
_output_shapes
: *
value	B :
�
]model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/splitSplit]model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd*
T0*
	num_split*@
_output_shapes.
,:	�>:	�>:	�>:	�>
�
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2ConstQ^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
valueB
 *  �?*
dtype0*
_output_shapes
: 
�
[model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/AddAdd_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:2_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2*
T0*
_output_shapes
:	�>
�
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/SigmoidSigmoid[model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add*
T0*
_output_shapes
:	�>
�
[model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MulMulRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_3_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid*
T0*
_output_shapes
:	�>
�
amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1Sigmoid]model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split*
T0*
_output_shapes
:	�>
�
\model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/TanhTanh_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:1*
T0*
_output_shapes
:	�>
�
]model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1Mulamodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1\model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh*
_output_shapes
:	�>*
T0
�
]model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1Add[model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul]model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1*
_output_shapes
:	�>*
T0
�
^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1Tanh]model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*
T0*
_output_shapes
:	�>
�
amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2Sigmoid_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:3*
T0*
_output_shapes
:	�>
�
]model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2Mul^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2*
T0*
_output_shapes
:	�>
�
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/SelectSelectTmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqualTmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select/Enter]model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes
:	�>*
T0*p
_classf
dbloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2
�
Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select/EnterEnterGmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zeros*p
_classf
dbloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
parallel_iterations *
is_constant(*
_output_shapes
:	�>*e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context*
T0
�
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_1SelectTmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqualRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_3]model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*
T0*p
_classf
dbloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1*
_output_shapes
:	�>
�
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_2SelectTmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqualRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_4]model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
T0*p
_classf
dbloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
_output_shapes
:	�>
�
kmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/SelectRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_2*
_output_shapes
: *
T0*p
_classf
dbloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2
�
qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterMmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*
T0*p
_classf
dbloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2*
parallel_iterations *
is_constant(*
_output_shapes
:*e

frame_nameWUmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context
�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1/yConstQ^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
�
Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1AddRmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1/y*
_output_shapes
: *
T0
�
Umodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIterationNextIterationKmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add*
_output_shapes
: *
T0
�
Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_1NextIterationMmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1*
_output_shapes
: *
T0
�
Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_2NextIterationkmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
�
Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_3NextIterationPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_1*
T0*
_output_shapes
:	�>
�
Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_4NextIterationPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_2*
_output_shapes
:	�>*
T0
�
Lmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/ExitExitNmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch*
T0*
_output_shapes
: 
�
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_1ExitPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_1*
_output_shapes
: *
T0
�
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_2ExitPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_2*
_output_shapes
: *
T0
�
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_3ExitPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_3*
T0*
_output_shapes
:	�>
�
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_4ExitPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_4*
T0*
_output_shapes
:	�>
�
dmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayNmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_2*`
_classV
TRloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*
_output_shapes
: 
�
^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/range/startConst*
dtype0*
_output_shapes
: *`
_classV
TRloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*
value	B : 
�
^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/range/deltaConst*`
_classV
TRloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*
value	B :*
dtype0*
_output_shapes
: 
�
Xmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/rangeRange^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/range/startdmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/TensorArraySizeV3^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/range/delta*#
_output_shapes
:���������*

Tidx0*`
_classV
TRloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray
�
fmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayXmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/rangeNmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_2*
element_shape:	�>*`
_classV
TRloc:@model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray*
dtype0*#
_output_shapes
:�>
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_5Const*
valueB"   �  *
dtype0*
_output_shapes
:
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Const_6Const*
valueB:>*
dtype0*
_output_shapes
:
�
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2_1/axisConst*
valueB: *
dtype0*
_output_shapes
:
�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2_1	ReverseV2fmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayStack/TensorArrayGatherV3Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2_1/axis*
T0*#
_output_shapes
:�>*

Tidx0
z
8model/lstm2d_2/vertical_pass/Horizontal_LSTM/concat/axisConst*
value	B :*
dtype0*
_output_shapes
: 
�
3model/lstm2d_2/vertical_pass/Horizontal_LSTM/concatConcatV2fmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayStack/TensorArrayGatherV3Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/ReverseV2_18model/lstm2d_2/vertical_pass/Horizontal_LSTM/concat/axis*

Tidx0*
T0*
N*#
_output_shapes
:�|
�
<model/lstm2d_2/vertical_pass/Horizontal_LSTM/Reshape_1/shapeConst*%
valueB"   #      |   *
dtype0*
_output_shapes
:
�
6model/lstm2d_2/vertical_pass/Horizontal_LSTM/Reshape_1Reshape3model/lstm2d_2/vertical_pass/Horizontal_LSTM/concat<model/lstm2d_2/vertical_pass/Horizontal_LSTM/Reshape_1/shape*
T0*
Tshape0*&
_output_shapes
:#|
�
=model/lstm2d_2/vertical_pass/Horizontal_LSTM/transpose_1/permConst*%
valueB"             *
dtype0*
_output_shapes
:
�
8model/lstm2d_2/vertical_pass/Horizontal_LSTM/transpose_1	Transpose6model/lstm2d_2/vertical_pass/Horizontal_LSTM/Reshape_1=model/lstm2d_2/vertical_pass/Horizontal_LSTM/transpose_1/perm*
Tperm0*
T0*&
_output_shapes
:#|
v
model/lstm2d_2/transpose/permConst*%
valueB"             *
dtype0*
_output_shapes
:
�
model/lstm2d_2/transpose	Transpose8model/lstm2d_2/vertical_pass/Horizontal_LSTM/transpose_1model/lstm2d_2/transpose/perm*&
_output_shapes
:#|*
Tperm0*
T0
m
model/transpose/permConst*%
valueB"             *
dtype0*
_output_shapes
:
�
model/transpose	Transposemodel/lstm2d_2/transposemodel/transpose/perm*
T0*&
_output_shapes
:#|*
Tperm0
f
model/Reshape_2/shapeConst*
valueB"����|   *
dtype0*
_output_shapes
:
z
model/Reshape_2Reshapemodel/transposemodel/Reshape_2/shape*
T0*
Tshape0*
_output_shapes
:	�|
�
/ctc_loss_1/w/Initializer/truncated_normal/shapeConst*
_class
loc:@ctc_loss_1/w*
valueB"|   �   *
dtype0*
_output_shapes
:
�
.ctc_loss_1/w/Initializer/truncated_normal/meanConst*
_class
loc:@ctc_loss_1/w*
valueB
 *    *
dtype0*
_output_shapes
: 
�
0ctc_loss_1/w/Initializer/truncated_normal/stddevConst*
_class
loc:@ctc_loss_1/w*
valueB
 *���=*
dtype0*
_output_shapes
: 
�
9ctc_loss_1/w/Initializer/truncated_normal/TruncatedNormalTruncatedNormal/ctc_loss_1/w/Initializer/truncated_normal/shape*
dtype0*
_output_shapes
:	|�*

seed *
T0*
_class
loc:@ctc_loss_1/w*
seed2 
�
-ctc_loss_1/w/Initializer/truncated_normal/mulMul9ctc_loss_1/w/Initializer/truncated_normal/TruncatedNormal0ctc_loss_1/w/Initializer/truncated_normal/stddev*
_output_shapes
:	|�*
T0*
_class
loc:@ctc_loss_1/w
�
)ctc_loss_1/w/Initializer/truncated_normalAdd-ctc_loss_1/w/Initializer/truncated_normal/mul.ctc_loss_1/w/Initializer/truncated_normal/mean*
T0*
_class
loc:@ctc_loss_1/w*
_output_shapes
:	|�
�
ctc_loss_1/w
VariableV2*
_output_shapes
:	|�*
shared_name *
_class
loc:@ctc_loss_1/w*
	container *
shape:	|�*
dtype0
�
ctc_loss_1/w/AssignAssignctc_loss_1/w)ctc_loss_1/w/Initializer/truncated_normal*
_output_shapes
:	|�*
use_locking(*
T0*
_class
loc:@ctc_loss_1/w*
validate_shape(
v
ctc_loss_1/w/readIdentityctc_loss_1/w*
T0*
_class
loc:@ctc_loss_1/w*
_output_shapes
:	|�
�
/ctc_loss_1/b/Initializer/truncated_normal/shapeConst*
_class
loc:@ctc_loss_1/b*
valueB:�*
dtype0*
_output_shapes
:
�
.ctc_loss_1/b/Initializer/truncated_normal/meanConst*
_class
loc:@ctc_loss_1/b*
valueB
 *    *
dtype0*
_output_shapes
: 
�
0ctc_loss_1/b/Initializer/truncated_normal/stddevConst*
_class
loc:@ctc_loss_1/b*
valueB
 *���=*
dtype0*
_output_shapes
: 
�
9ctc_loss_1/b/Initializer/truncated_normal/TruncatedNormalTruncatedNormal/ctc_loss_1/b/Initializer/truncated_normal/shape*
T0*
_class
loc:@ctc_loss_1/b*
seed2 *
dtype0*
_output_shapes	
:�*

seed 
�
-ctc_loss_1/b/Initializer/truncated_normal/mulMul9ctc_loss_1/b/Initializer/truncated_normal/TruncatedNormal0ctc_loss_1/b/Initializer/truncated_normal/stddev*
_output_shapes	
:�*
T0*
_class
loc:@ctc_loss_1/b
�
)ctc_loss_1/b/Initializer/truncated_normalAdd-ctc_loss_1/b/Initializer/truncated_normal/mul.ctc_loss_1/b/Initializer/truncated_normal/mean*
T0*
_class
loc:@ctc_loss_1/b*
_output_shapes	
:�
�
ctc_loss_1/b
VariableV2*
shared_name *
_class
loc:@ctc_loss_1/b*
	container *
shape:�*
dtype0*
_output_shapes	
:�
�
ctc_loss_1/b/AssignAssignctc_loss_1/b)ctc_loss_1/b/Initializer/truncated_normal*
_output_shapes	
:�*
use_locking(*
T0*
_class
loc:@ctc_loss_1/b*
validate_shape(
r
ctc_loss_1/b/readIdentityctc_loss_1/b*
_output_shapes	
:�*
T0*
_class
loc:@ctc_loss_1/b
�
0ctc_loss_1/w1/Initializer/truncated_normal/shapeConst* 
_class
loc:@ctc_loss_1/w1*
valueB"�   Q   *
dtype0*
_output_shapes
:
�
/ctc_loss_1/w1/Initializer/truncated_normal/meanConst*
_output_shapes
: * 
_class
loc:@ctc_loss_1/w1*
valueB
 *    *
dtype0
�
1ctc_loss_1/w1/Initializer/truncated_normal/stddevConst* 
_class
loc:@ctc_loss_1/w1*
valueB
 *���=*
dtype0*
_output_shapes
: 
�
:ctc_loss_1/w1/Initializer/truncated_normal/TruncatedNormalTruncatedNormal0ctc_loss_1/w1/Initializer/truncated_normal/shape*
seed2 *
dtype0*
_output_shapes
:	�Q*

seed *
T0* 
_class
loc:@ctc_loss_1/w1
�
.ctc_loss_1/w1/Initializer/truncated_normal/mulMul:ctc_loss_1/w1/Initializer/truncated_normal/TruncatedNormal1ctc_loss_1/w1/Initializer/truncated_normal/stddev*
T0* 
_class
loc:@ctc_loss_1/w1*
_output_shapes
:	�Q
�
*ctc_loss_1/w1/Initializer/truncated_normalAdd.ctc_loss_1/w1/Initializer/truncated_normal/mul/ctc_loss_1/w1/Initializer/truncated_normal/mean*
T0* 
_class
loc:@ctc_loss_1/w1*
_output_shapes
:	�Q
�
ctc_loss_1/w1
VariableV2*
_output_shapes
:	�Q*
shared_name * 
_class
loc:@ctc_loss_1/w1*
	container *
shape:	�Q*
dtype0
�
ctc_loss_1/w1/AssignAssignctc_loss_1/w1*ctc_loss_1/w1/Initializer/truncated_normal*
_output_shapes
:	�Q*
use_locking(*
T0* 
_class
loc:@ctc_loss_1/w1*
validate_shape(
y
ctc_loss_1/w1/readIdentityctc_loss_1/w1* 
_class
loc:@ctc_loss_1/w1*
_output_shapes
:	�Q*
T0
�
0ctc_loss_1/b1/Initializer/truncated_normal/shapeConst* 
_class
loc:@ctc_loss_1/b1*
valueB:Q*
dtype0*
_output_shapes
:
�
/ctc_loss_1/b1/Initializer/truncated_normal/meanConst* 
_class
loc:@ctc_loss_1/b1*
valueB
 *    *
dtype0*
_output_shapes
: 
�
1ctc_loss_1/b1/Initializer/truncated_normal/stddevConst* 
_class
loc:@ctc_loss_1/b1*
valueB
 *���=*
dtype0*
_output_shapes
: 
�
:ctc_loss_1/b1/Initializer/truncated_normal/TruncatedNormalTruncatedNormal0ctc_loss_1/b1/Initializer/truncated_normal/shape*
dtype0*
_output_shapes
:Q*

seed *
T0* 
_class
loc:@ctc_loss_1/b1*
seed2 
�
.ctc_loss_1/b1/Initializer/truncated_normal/mulMul:ctc_loss_1/b1/Initializer/truncated_normal/TruncatedNormal1ctc_loss_1/b1/Initializer/truncated_normal/stddev*
_output_shapes
:Q*
T0* 
_class
loc:@ctc_loss_1/b1
�
*ctc_loss_1/b1/Initializer/truncated_normalAdd.ctc_loss_1/b1/Initializer/truncated_normal/mul/ctc_loss_1/b1/Initializer/truncated_normal/mean*
T0* 
_class
loc:@ctc_loss_1/b1*
_output_shapes
:Q
�
ctc_loss_1/b1
VariableV2* 
_class
loc:@ctc_loss_1/b1*
	container *
shape:Q*
dtype0*
_output_shapes
:Q*
shared_name 
�
ctc_loss_1/b1/AssignAssignctc_loss_1/b1*ctc_loss_1/b1/Initializer/truncated_normal*
use_locking(*
T0* 
_class
loc:@ctc_loss_1/b1*
validate_shape(*
_output_shapes
:Q
t
ctc_loss_1/b1/readIdentityctc_loss_1/b1*
T0* 
_class
loc:@ctc_loss_1/b1*
_output_shapes
:Q
{
model/Train/histogram-b-ctc/tagConst*,
value#B! Bmodel/Train/histogram-b-ctc*
dtype0*
_output_shapes
: 
�
model/Train/histogram-b-ctcHistogramSummarymodel/Train/histogram-b-ctc/tagctc_loss_1/b/read*
_output_shapes
: *
T0
{
model/Train/histogram-w-ctc/tagConst*,
value#B! Bmodel/Train/histogram-w-ctc*
dtype0*
_output_shapes
: 
�
model/Train/histogram-w-ctcHistogramSummarymodel/Train/histogram-w-ctc/tagctc_loss_1/w/read*
T0*
_output_shapes
: 
�
model/MatMulMatMulmodel/Reshape_2ctc_loss_1/w/read*
T0*
transpose_a( * 
_output_shapes
:
��*
transpose_b( 
\
	model/addAddmodel/MatMulctc_loss_1/b/read*
T0* 
_output_shapes
:
��
X
model/dropout/IdentityIdentity	model/add*
T0* 
_output_shapes
:
��
�
model/MatMul_1MatMulmodel/dropout/Identityctc_loss_1/w1/read*
transpose_b( *
T0*
transpose_a( *
_output_shapes
:	�Q
`
model/add_1Addmodel/MatMul_1ctc_loss_1/b1/read*
T0*
_output_shapes
:	�Q
j
model/Reshape_3/shapeConst*!
valueB"����#   Q   *
dtype0*
_output_shapes
:
y
model/Reshape_3Reshapemodel/add_1model/Reshape_3/shape*
T0*
Tshape0*"
_output_shapes
:#Q
k
model/conv1/weights/tagConst*$
valueB Bmodel/conv1/weights*
dtype0*
_output_shapes
: 
u
model/conv1/weightsHistogramSummarymodel/conv1/weights/tagconv1/weights/read*
_output_shapes
: *
T0
y
model/conv1/BatchNorm/beta/tagConst*+
value"B  Bmodel/conv1/BatchNorm/beta*
dtype0*
_output_shapes
: 
�
model/conv1/BatchNorm/betaHistogramSummarymodel/conv1/BatchNorm/beta/tagconv1/BatchNorm/beta/read*
T0*
_output_shapes
: 
�
%model/conv1/BatchNorm/moving_mean/tagConst*
dtype0*
_output_shapes
: *2
value)B' B!model/conv1/BatchNorm/moving_mean
�
!model/conv1/BatchNorm/moving_meanHistogramSummary%model/conv1/BatchNorm/moving_mean/tag conv1/BatchNorm/moving_mean/read*
T0*
_output_shapes
: 
�
)model/conv1/BatchNorm/moving_variance/tagConst*6
value-B+ B%model/conv1/BatchNorm/moving_variance*
dtype0*
_output_shapes
: 
�
%model/conv1/BatchNorm/moving_varianceHistogramSummary)model/conv1/BatchNorm/moving_variance/tag$conv1/BatchNorm/moving_variance/read*
T0*
_output_shapes
: 

!model/fully_connected/weights/tagConst*.
value%B# Bmodel/fully_connected/weights*
dtype0*
_output_shapes
: 
�
model/fully_connected/weightsHistogramSummary!model/fully_connected/weights/tagfully_connected/weights/read*
T0*
_output_shapes
: 
�
(model/fully_connected/BatchNorm/beta/tagConst*5
value,B* B$model/fully_connected/BatchNorm/beta*
dtype0*
_output_shapes
: 
�
$model/fully_connected/BatchNorm/betaHistogramSummary(model/fully_connected/BatchNorm/beta/tag#fully_connected/BatchNorm/beta/read*
T0*
_output_shapes
: 
�
/model/fully_connected/BatchNorm/moving_mean/tagConst*<
value3B1 B+model/fully_connected/BatchNorm/moving_mean*
dtype0*
_output_shapes
: 
�
+model/fully_connected/BatchNorm/moving_meanHistogramSummary/model/fully_connected/BatchNorm/moving_mean/tag*fully_connected/BatchNorm/moving_mean/read*
_output_shapes
: *
T0
�
3model/fully_connected/BatchNorm/moving_variance/tagConst*@
value7B5 B/model/fully_connected/BatchNorm/moving_variance*
dtype0*
_output_shapes
: 
�
/model/fully_connected/BatchNorm/moving_varianceHistogramSummary3model/fully_connected/BatchNorm/moving_variance/tag.fully_connected/BatchNorm/moving_variance/read*
_output_shapes
: *
T0
P

save/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
�
save/StringJoin/inputs_1Const*<
value3B1 B+_temp_c15a1898c6f34727bb1396e15b37cff1/part*
dtype0*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
\
save/ShardedFilename/shardConst*
_output_shapes
: *
value	B : *
dtype0
}
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards*
_output_shapes
: 
�
save/SaveV2/tensor_namesConst*�
value�B�Bconv1/BatchNorm/betaBconv1/weightsBctc_loss_1/bBctc_loss_1/b1Bctc_loss_1/wBctc_loss_1/w1Bfully_connected/BatchNorm/betaBfully_connected/weightsBRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:
�
save/SaveV2/shape_and_slicesConst*
dtype0*
_output_shapes
:*C
value:B8B B B B B B B B B B B B B B B B B B B B B B B B 
�
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesconv1/BatchNorm/betaconv1/weightsctc_loss_1/bctc_loss_1/b1ctc_loss_1/wctc_loss_1/w1fully_connected/BatchNorm/betafully_connected/weightsRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*&
dtypes
2
�
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
�
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency*
T0*

axis *
N*
_output_shapes
:
}
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const*
delete_old_dirs(
z
save/IdentityIdentity
save/Const^save/control_dependency^save/MergeV2Checkpoints*
_output_shapes
: *
T0
�
save/RestoreV2/tensor_namesConst*�
value�B�Bconv1/BatchNorm/betaBconv1/weightsBctc_loss_1/bBctc_loss_1/b1Bctc_loss_1/wBctc_loss_1/w1Bfully_connected/BatchNorm/betaBfully_connected/weightsBRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:
�
save/RestoreV2/shape_and_slicesConst*C
value:B8B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*t
_output_shapesb
`::::::::::::::::::::::::*&
dtypes
2
�
save/AssignAssignconv1/BatchNorm/betasave/RestoreV2*
use_locking(*
T0*'
_class
loc:@conv1/BatchNorm/beta*
validate_shape(*
_output_shapes
:
�
save/Assign_1Assignconv1/weightssave/RestoreV2:1* 
_class
loc:@conv1/weights*
validate_shape(*&
_output_shapes
:*
use_locking(*
T0
�
save/Assign_2Assignctc_loss_1/bsave/RestoreV2:2*
validate_shape(*
_output_shapes	
:�*
use_locking(*
T0*
_class
loc:@ctc_loss_1/b
�
save/Assign_3Assignctc_loss_1/b1save/RestoreV2:3*
T0* 
_class
loc:@ctc_loss_1/b1*
validate_shape(*
_output_shapes
:Q*
use_locking(
�
save/Assign_4Assignctc_loss_1/wsave/RestoreV2:4*
_output_shapes
:	|�*
use_locking(*
T0*
_class
loc:@ctc_loss_1/w*
validate_shape(
�
save/Assign_5Assignctc_loss_1/w1save/RestoreV2:5* 
_class
loc:@ctc_loss_1/w1*
validate_shape(*
_output_shapes
:	�Q*
use_locking(*
T0
�
save/Assign_6Assignfully_connected/BatchNorm/betasave/RestoreV2:6*
T0*1
_class'
%#loc:@fully_connected/BatchNorm/beta*
validate_shape(*
_output_shapes
:*
use_locking(
�
save/Assign_7Assignfully_connected/weightssave/RestoreV2:7*
use_locking(*
T0**
_class 
loc:@fully_connected/weights*
validate_shape(*
_output_shapes

:
�
save/Assign_8AssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave/RestoreV2:8*
_output_shapes
:*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(
�
save/Assign_9AssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave/RestoreV2:9*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	�
�
save/Assign_10AssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave/RestoreV2:10*
T0*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:*
use_locking(
�
save/Assign_11AssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave/RestoreV2:11*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	�
�
save/Assign_12AssignPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave/RestoreV2:12*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:
�
save/Assign_13AssignRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave/RestoreV2:13*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes

:
�
save/Assign_14AssignPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave/RestoreV2:14*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:
�
save/Assign_15AssignRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave/RestoreV2:15*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes

:
�
save/Assign_16AssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave/RestoreV2:16*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�*
use_locking(
�
save/Assign_17AssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave/RestoreV2:17*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	D�
�
save/Assign_18AssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave/RestoreV2:18*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save/Assign_19AssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave/RestoreV2:19*
validate_shape(*
_output_shapes
:	D�*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
save/Assign_20AssignPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave/RestoreV2:20*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save/Assign_21AssignRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave/RestoreV2:21*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(* 
_output_shapes
:
��
�
save/Assign_22AssignPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave/RestoreV2:22*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save/Assign_23AssignRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave/RestoreV2:23*
validate_shape(* 
_output_shapes
:
��*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_20^save/Assign_21^save/Assign_22^save/Assign_23
-
save/restore_allNoOp^save/restore_shard
�
initNoOp^conv1/weights/Assign^conv1/BatchNorm/beta/Assign#^conv1/BatchNorm/moving_mean/Assign'^conv1/BatchNorm/moving_variance/Assign\^lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign\^lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign^fully_connected/weights/Assign&^fully_connected/BatchNorm/beta/Assign-^fully_connected/BatchNorm/moving_mean/Assign1^fully_connected/BatchNorm/moving_variance/Assign\^lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign\^lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign^ctc_loss_1/w/Assign^ctc_loss_1/b/Assign^ctc_loss_1/w1/Assign^ctc_loss_1/b1/Assign
R
save_1/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
�
save_1/StringJoin/inputs_1Const*
dtype0*
_output_shapes
: *<
value3B1 B+_temp_6f98ecd41ba64e27add2c8bc88cb58ac/part
{
save_1/StringJoin
StringJoinsave_1/Constsave_1/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
S
save_1/num_shardsConst*
_output_shapes
: *
value	B :*
dtype0
^
save_1/ShardedFilename/shardConst*
_output_shapes
: *
value	B : *
dtype0
�
save_1/ShardedFilenameShardedFilenamesave_1/StringJoinsave_1/ShardedFilename/shardsave_1/num_shards*
_output_shapes
: 
�
save_1/SaveV2/tensor_namesConst*�
value�B�Bconv1/BatchNorm/betaBconv1/BatchNorm/moving_meanBconv1/BatchNorm/moving_varianceBconv1/weightsBctc_loss_1/bBctc_loss_1/b1Bctc_loss_1/wBctc_loss_1/w1Bfully_connected/BatchNorm/betaB%fully_connected/BatchNorm/moving_meanB)fully_connected/BatchNorm/moving_varianceBfully_connected/weightsBRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:
�
save_1/SaveV2/shape_and_slicesConst*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save_1/SaveV2SaveV2save_1/ShardedFilenamesave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slicesconv1/BatchNorm/betaconv1/BatchNorm/moving_meanconv1/BatchNorm/moving_varianceconv1/weightsctc_loss_1/bctc_loss_1/b1ctc_loss_1/wctc_loss_1/w1fully_connected/BatchNorm/beta%fully_connected/BatchNorm/moving_mean)fully_connected/BatchNorm/moving_variancefully_connected/weightsRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel**
dtypes 
2
�
save_1/control_dependencyIdentitysave_1/ShardedFilename^save_1/SaveV2*
_output_shapes
: *
T0*)
_class
loc:@save_1/ShardedFilename
�
-save_1/MergeV2Checkpoints/checkpoint_prefixesPacksave_1/ShardedFilename^save_1/control_dependency*
T0*

axis *
N*
_output_shapes
:
�
save_1/MergeV2CheckpointsMergeV2Checkpoints-save_1/MergeV2Checkpoints/checkpoint_prefixessave_1/Const*
delete_old_dirs(
�
save_1/IdentityIdentitysave_1/Const^save_1/control_dependency^save_1/MergeV2Checkpoints*
_output_shapes
: *
T0
�
save_1/RestoreV2/tensor_namesConst*�
value�B�Bconv1/BatchNorm/betaBconv1/BatchNorm/moving_meanBconv1/BatchNorm/moving_varianceBconv1/weightsBctc_loss_1/bBctc_loss_1/b1Bctc_loss_1/wBctc_loss_1/w1Bfully_connected/BatchNorm/betaB%fully_connected/BatchNorm/moving_meanB)fully_connected/BatchNorm/moving_varianceBfully_connected/weightsBRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:
�
!save_1/RestoreV2/shape_and_slicesConst*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices**
dtypes 
2*�
_output_shapesr
p::::::::::::::::::::::::::::
�
save_1/AssignAssignconv1/BatchNorm/betasave_1/RestoreV2*'
_class
loc:@conv1/BatchNorm/beta*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save_1/Assign_1Assignconv1/BatchNorm/moving_meansave_1/RestoreV2:1*
use_locking(*
T0*.
_class$
" loc:@conv1/BatchNorm/moving_mean*
validate_shape(*
_output_shapes
:
�
save_1/Assign_2Assignconv1/BatchNorm/moving_variancesave_1/RestoreV2:2*
use_locking(*
T0*2
_class(
&$loc:@conv1/BatchNorm/moving_variance*
validate_shape(*
_output_shapes
:
�
save_1/Assign_3Assignconv1/weightssave_1/RestoreV2:3*
T0* 
_class
loc:@conv1/weights*
validate_shape(*&
_output_shapes
:*
use_locking(
�
save_1/Assign_4Assignctc_loss_1/bsave_1/RestoreV2:4*
use_locking(*
T0*
_class
loc:@ctc_loss_1/b*
validate_shape(*
_output_shapes	
:�
�
save_1/Assign_5Assignctc_loss_1/b1save_1/RestoreV2:5*
_output_shapes
:Q*
use_locking(*
T0* 
_class
loc:@ctc_loss_1/b1*
validate_shape(
�
save_1/Assign_6Assignctc_loss_1/wsave_1/RestoreV2:6*
T0*
_class
loc:@ctc_loss_1/w*
validate_shape(*
_output_shapes
:	|�*
use_locking(
�
save_1/Assign_7Assignctc_loss_1/w1save_1/RestoreV2:7* 
_class
loc:@ctc_loss_1/w1*
validate_shape(*
_output_shapes
:	�Q*
use_locking(*
T0
�
save_1/Assign_8Assignfully_connected/BatchNorm/betasave_1/RestoreV2:8*
use_locking(*
T0*1
_class'
%#loc:@fully_connected/BatchNorm/beta*
validate_shape(*
_output_shapes
:
�
save_1/Assign_9Assign%fully_connected/BatchNorm/moving_meansave_1/RestoreV2:9*
use_locking(*
T0*8
_class.
,*loc:@fully_connected/BatchNorm/moving_mean*
validate_shape(*
_output_shapes
:
�
save_1/Assign_10Assign)fully_connected/BatchNorm/moving_variancesave_1/RestoreV2:10*
use_locking(*
T0*<
_class2
0.loc:@fully_connected/BatchNorm/moving_variance*
validate_shape(*
_output_shapes
:
�
save_1/Assign_11Assignfully_connected/weightssave_1/RestoreV2:11*
validate_shape(*
_output_shapes

:*
use_locking(*
T0**
_class 
loc:@fully_connected/weights
�
save_1/Assign_12AssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_1/RestoreV2:12*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:
�
save_1/Assign_13AssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_1/RestoreV2:13*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	�*
use_locking(
�
save_1/Assign_14AssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_1/RestoreV2:14*
_output_shapes
:*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(
�
save_1/Assign_15AssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_1/RestoreV2:15*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	�*
use_locking(
�
save_1/Assign_16AssignPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_1/RestoreV2:16*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias
�
save_1/Assign_17AssignRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_1/RestoreV2:17*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes

:
�
save_1/Assign_18AssignPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_1/RestoreV2:18*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save_1/Assign_19AssignRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_1/RestoreV2:19*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes

:*
use_locking(
�
save_1/Assign_20AssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_1/RestoreV2:20*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_1/Assign_21AssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_1/RestoreV2:21*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	D�
�
save_1/Assign_22AssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_1/RestoreV2:22*
validate_shape(*
_output_shapes	
:�*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias
�
save_1/Assign_23AssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_1/RestoreV2:23*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	D�*
use_locking(*
T0
�
save_1/Assign_24AssignPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_1/RestoreV2:24*
_output_shapes	
:�*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(
�
save_1/Assign_25AssignRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_1/RestoreV2:25* 
_output_shapes
:
��*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(
�
save_1/Assign_26AssignPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_1/RestoreV2:26*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_1/Assign_27AssignRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_1/RestoreV2:27*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(* 
_output_shapes
:
��
�
save_1/restore_shardNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_2^save_1/Assign_3^save_1/Assign_4^save_1/Assign_5^save_1/Assign_6^save_1/Assign_7^save_1/Assign_8^save_1/Assign_9^save_1/Assign_10^save_1/Assign_11^save_1/Assign_12^save_1/Assign_13^save_1/Assign_14^save_1/Assign_15^save_1/Assign_16^save_1/Assign_17^save_1/Assign_18^save_1/Assign_19^save_1/Assign_20^save_1/Assign_21^save_1/Assign_22^save_1/Assign_23^save_1/Assign_24^save_1/Assign_25^save_1/Assign_26^save_1/Assign_27
1
save_1/restore_allNoOp^save_1/restore_shard
�
init_1NoOp^conv1/weights/Assign^conv1/BatchNorm/beta/Assign#^conv1/BatchNorm/moving_mean/Assign'^conv1/BatchNorm/moving_variance/Assign\^lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign\^lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign^fully_connected/weights/Assign&^fully_connected/BatchNorm/beta/Assign-^fully_connected/BatchNorm/moving_mean/Assign1^fully_connected/BatchNorm/moving_variance/Assign\^lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign\^lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign^ctc_loss_1/w/Assign^ctc_loss_1/b/Assign^ctc_loss_1/w1/Assign^ctc_loss_1/b1/Assign
R
save_2/ConstConst*
dtype0*
_output_shapes
: *
valueB Bmodel
�
save_2/StringJoin/inputs_1Const*<
value3B1 B+_temp_b8a512d9f0574d7faaf24f84bf1d98d9/part*
dtype0*
_output_shapes
: 
{
save_2/StringJoin
StringJoinsave_2/Constsave_2/StringJoin/inputs_1*
	separator *
N*
_output_shapes
: 
S
save_2/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
^
save_2/ShardedFilename/shardConst*
value	B : *
dtype0*
_output_shapes
: 
�
save_2/ShardedFilenameShardedFilenamesave_2/StringJoinsave_2/ShardedFilename/shardsave_2/num_shards*
_output_shapes
: 
�
save_2/SaveV2/tensor_namesConst*
dtype0*
_output_shapes
:*�
value�B�Bconv1/BatchNorm/betaBconv1/BatchNorm/moving_meanBconv1/BatchNorm/moving_varianceBconv1/weightsBctc_loss_1/bBctc_loss_1/b1Bctc_loss_1/wBctc_loss_1/w1Bfully_connected/BatchNorm/betaB%fully_connected/BatchNorm/moving_meanB)fully_connected/BatchNorm/moving_varianceBfully_connected/weightsBRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
save_2/SaveV2/shape_and_slicesConst*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save_2/SaveV2SaveV2save_2/ShardedFilenamesave_2/SaveV2/tensor_namessave_2/SaveV2/shape_and_slicesconv1/BatchNorm/betaconv1/BatchNorm/moving_meanconv1/BatchNorm/moving_varianceconv1/weightsctc_loss_1/bctc_loss_1/b1ctc_loss_1/wctc_loss_1/w1fully_connected/BatchNorm/beta%fully_connected/BatchNorm/moving_mean)fully_connected/BatchNorm/moving_variancefully_connected/weightsRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel**
dtypes 
2
�
save_2/control_dependencyIdentitysave_2/ShardedFilename^save_2/SaveV2*
T0*)
_class
loc:@save_2/ShardedFilename*
_output_shapes
: 
�
-save_2/MergeV2Checkpoints/checkpoint_prefixesPacksave_2/ShardedFilename^save_2/control_dependency*
T0*

axis *
N*
_output_shapes
:
�
save_2/MergeV2CheckpointsMergeV2Checkpoints-save_2/MergeV2Checkpoints/checkpoint_prefixessave_2/Const*
delete_old_dirs(
�
save_2/IdentityIdentitysave_2/Const^save_2/control_dependency^save_2/MergeV2Checkpoints*
_output_shapes
: *
T0
�
save_2/RestoreV2/tensor_namesConst*
dtype0*
_output_shapes
:*�
value�B�Bconv1/BatchNorm/betaBconv1/BatchNorm/moving_meanBconv1/BatchNorm/moving_varianceBconv1/weightsBctc_loss_1/bBctc_loss_1/b1Bctc_loss_1/wBctc_loss_1/w1Bfully_connected/BatchNorm/betaB%fully_connected/BatchNorm/moving_meanB)fully_connected/BatchNorm/moving_varianceBfully_connected/weightsBRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
!save_2/RestoreV2/shape_and_slicesConst*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save_2/RestoreV2	RestoreV2save_2/Constsave_2/RestoreV2/tensor_names!save_2/RestoreV2/shape_and_slices*�
_output_shapesr
p::::::::::::::::::::::::::::**
dtypes 
2
�
save_2/AssignAssignconv1/BatchNorm/betasave_2/RestoreV2*
use_locking(*
T0*'
_class
loc:@conv1/BatchNorm/beta*
validate_shape(*
_output_shapes
:
�
save_2/Assign_1Assignconv1/BatchNorm/moving_meansave_2/RestoreV2:1*
use_locking(*
T0*.
_class$
" loc:@conv1/BatchNorm/moving_mean*
validate_shape(*
_output_shapes
:
�
save_2/Assign_2Assignconv1/BatchNorm/moving_variancesave_2/RestoreV2:2*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*2
_class(
&$loc:@conv1/BatchNorm/moving_variance
�
save_2/Assign_3Assignconv1/weightssave_2/RestoreV2:3* 
_class
loc:@conv1/weights*
validate_shape(*&
_output_shapes
:*
use_locking(*
T0
�
save_2/Assign_4Assignctc_loss_1/bsave_2/RestoreV2:4*
validate_shape(*
_output_shapes	
:�*
use_locking(*
T0*
_class
loc:@ctc_loss_1/b
�
save_2/Assign_5Assignctc_loss_1/b1save_2/RestoreV2:5*
use_locking(*
T0* 
_class
loc:@ctc_loss_1/b1*
validate_shape(*
_output_shapes
:Q
�
save_2/Assign_6Assignctc_loss_1/wsave_2/RestoreV2:6*
_class
loc:@ctc_loss_1/w*
validate_shape(*
_output_shapes
:	|�*
use_locking(*
T0
�
save_2/Assign_7Assignctc_loss_1/w1save_2/RestoreV2:7*
use_locking(*
T0* 
_class
loc:@ctc_loss_1/w1*
validate_shape(*
_output_shapes
:	�Q
�
save_2/Assign_8Assignfully_connected/BatchNorm/betasave_2/RestoreV2:8*
use_locking(*
T0*1
_class'
%#loc:@fully_connected/BatchNorm/beta*
validate_shape(*
_output_shapes
:
�
save_2/Assign_9Assign%fully_connected/BatchNorm/moving_meansave_2/RestoreV2:9*8
_class.
,*loc:@fully_connected/BatchNorm/moving_mean*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save_2/Assign_10Assign)fully_connected/BatchNorm/moving_variancesave_2/RestoreV2:10*
use_locking(*
T0*<
_class2
0.loc:@fully_connected/BatchNorm/moving_variance*
validate_shape(*
_output_shapes
:
�
save_2/Assign_11Assignfully_connected/weightssave_2/RestoreV2:11**
_class 
loc:@fully_connected/weights*
validate_shape(*
_output_shapes

:*
use_locking(*
T0
�
save_2/Assign_12AssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_2/RestoreV2:12*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias
�
save_2/Assign_13AssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_2/RestoreV2:13*
validate_shape(*
_output_shapes
:	�*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
save_2/Assign_14AssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_2/RestoreV2:14*
T0*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:*
use_locking(
�
save_2/Assign_15AssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_2/RestoreV2:15*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	�
�
save_2/Assign_16AssignPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_2/RestoreV2:16*
_output_shapes
:*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(
�
save_2/Assign_17AssignRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_2/RestoreV2:17*
_output_shapes

:*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(
�
save_2/Assign_18AssignPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_2/RestoreV2:18*
_output_shapes
:*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(
�
save_2/Assign_19AssignRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_2/RestoreV2:19*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes

:*
use_locking(*
T0
�
save_2/Assign_20AssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_2/RestoreV2:20*
validate_shape(*
_output_shapes	
:�*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias
�
save_2/Assign_21AssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_2/RestoreV2:21*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	D�*
use_locking(*
T0
�
save_2/Assign_22AssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_2/RestoreV2:22*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_2/Assign_23AssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_2/RestoreV2:23*
_output_shapes
:	D�*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(
�
save_2/Assign_24AssignPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_2/RestoreV2:24*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_2/Assign_25AssignRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_2/RestoreV2:25*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(* 
_output_shapes
:
��
�
save_2/Assign_26AssignPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_2/RestoreV2:26*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_2/Assign_27AssignRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_2/RestoreV2:27*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(* 
_output_shapes
:
��*
use_locking(*
T0
�
save_2/restore_shardNoOp^save_2/Assign^save_2/Assign_1^save_2/Assign_2^save_2/Assign_3^save_2/Assign_4^save_2/Assign_5^save_2/Assign_6^save_2/Assign_7^save_2/Assign_8^save_2/Assign_9^save_2/Assign_10^save_2/Assign_11^save_2/Assign_12^save_2/Assign_13^save_2/Assign_14^save_2/Assign_15^save_2/Assign_16^save_2/Assign_17^save_2/Assign_18^save_2/Assign_19^save_2/Assign_20^save_2/Assign_21^save_2/Assign_22^save_2/Assign_23^save_2/Assign_24^save_2/Assign_25^save_2/Assign_26^save_2/Assign_27
1
save_2/restore_allNoOp^save_2/restore_shard
�
init_2NoOp^conv1/weights/Assign^conv1/BatchNorm/beta/Assign#^conv1/BatchNorm/moving_mean/Assign'^conv1/BatchNorm/moving_variance/Assign\^lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign\^lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign^fully_connected/weights/Assign&^fully_connected/BatchNorm/beta/Assign-^fully_connected/BatchNorm/moving_mean/Assign1^fully_connected/BatchNorm/moving_variance/Assign\^lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign\^lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign^ctc_loss_1/w/Assign^ctc_loss_1/b/Assign^ctc_loss_1/w1/Assign^ctc_loss_1/b1/Assign
R
save_3/ConstConst*
_output_shapes
: *
valueB Bmodel*
dtype0
�
save_3/StringJoin/inputs_1Const*<
value3B1 B+_temp_e73a6dc896084472b3a1ca0e0e097a09/part*
dtype0*
_output_shapes
: 
{
save_3/StringJoin
StringJoinsave_3/Constsave_3/StringJoin/inputs_1*
_output_shapes
: *
	separator *
N
S
save_3/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
^
save_3/ShardedFilename/shardConst*
_output_shapes
: *
value	B : *
dtype0
�
save_3/ShardedFilenameShardedFilenamesave_3/StringJoinsave_3/ShardedFilename/shardsave_3/num_shards*
_output_shapes
: 
�
save_3/SaveV2/tensor_namesConst*
dtype0*
_output_shapes
:*�
value�B�Bconv1/BatchNorm/betaBconv1/BatchNorm/moving_meanBconv1/BatchNorm/moving_varianceBconv1/weightsBctc_loss_1/bBctc_loss_1/b1Bctc_loss_1/wBctc_loss_1/w1Bfully_connected/BatchNorm/betaB%fully_connected/BatchNorm/moving_meanB)fully_connected/BatchNorm/moving_varianceBfully_connected/weightsBRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
save_3/SaveV2/shape_and_slicesConst*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save_3/SaveV2SaveV2save_3/ShardedFilenamesave_3/SaveV2/tensor_namessave_3/SaveV2/shape_and_slicesconv1/BatchNorm/betaconv1/BatchNorm/moving_meanconv1/BatchNorm/moving_varianceconv1/weightsctc_loss_1/bctc_loss_1/b1ctc_loss_1/wctc_loss_1/w1fully_connected/BatchNorm/beta%fully_connected/BatchNorm/moving_mean)fully_connected/BatchNorm/moving_variancefully_connected/weightsRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel**
dtypes 
2
�
save_3/control_dependencyIdentitysave_3/ShardedFilename^save_3/SaveV2*
T0*)
_class
loc:@save_3/ShardedFilename*
_output_shapes
: 
�
-save_3/MergeV2Checkpoints/checkpoint_prefixesPacksave_3/ShardedFilename^save_3/control_dependency*
N*
_output_shapes
:*
T0*

axis 
�
save_3/MergeV2CheckpointsMergeV2Checkpoints-save_3/MergeV2Checkpoints/checkpoint_prefixessave_3/Const*
delete_old_dirs(
�
save_3/IdentityIdentitysave_3/Const^save_3/control_dependency^save_3/MergeV2Checkpoints*
_output_shapes
: *
T0
�
save_3/RestoreV2/tensor_namesConst*�
value�B�Bconv1/BatchNorm/betaBconv1/BatchNorm/moving_meanBconv1/BatchNorm/moving_varianceBconv1/weightsBctc_loss_1/bBctc_loss_1/b1Bctc_loss_1/wBctc_loss_1/w1Bfully_connected/BatchNorm/betaB%fully_connected/BatchNorm/moving_meanB)fully_connected/BatchNorm/moving_varianceBfully_connected/weightsBRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:
�
!save_3/RestoreV2/shape_and_slicesConst*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save_3/RestoreV2	RestoreV2save_3/Constsave_3/RestoreV2/tensor_names!save_3/RestoreV2/shape_and_slices*�
_output_shapesr
p::::::::::::::::::::::::::::**
dtypes 
2
�
save_3/AssignAssignconv1/BatchNorm/betasave_3/RestoreV2*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*'
_class
loc:@conv1/BatchNorm/beta
�
save_3/Assign_1Assignconv1/BatchNorm/moving_meansave_3/RestoreV2:1*
use_locking(*
T0*.
_class$
" loc:@conv1/BatchNorm/moving_mean*
validate_shape(*
_output_shapes
:
�
save_3/Assign_2Assignconv1/BatchNorm/moving_variancesave_3/RestoreV2:2*
use_locking(*
T0*2
_class(
&$loc:@conv1/BatchNorm/moving_variance*
validate_shape(*
_output_shapes
:
�
save_3/Assign_3Assignconv1/weightssave_3/RestoreV2:3* 
_class
loc:@conv1/weights*
validate_shape(*&
_output_shapes
:*
use_locking(*
T0
�
save_3/Assign_4Assignctc_loss_1/bsave_3/RestoreV2:4*
T0*
_class
loc:@ctc_loss_1/b*
validate_shape(*
_output_shapes	
:�*
use_locking(
�
save_3/Assign_5Assignctc_loss_1/b1save_3/RestoreV2:5*
use_locking(*
T0* 
_class
loc:@ctc_loss_1/b1*
validate_shape(*
_output_shapes
:Q
�
save_3/Assign_6Assignctc_loss_1/wsave_3/RestoreV2:6*
validate_shape(*
_output_shapes
:	|�*
use_locking(*
T0*
_class
loc:@ctc_loss_1/w
�
save_3/Assign_7Assignctc_loss_1/w1save_3/RestoreV2:7*
T0* 
_class
loc:@ctc_loss_1/w1*
validate_shape(*
_output_shapes
:	�Q*
use_locking(
�
save_3/Assign_8Assignfully_connected/BatchNorm/betasave_3/RestoreV2:8*
use_locking(*
T0*1
_class'
%#loc:@fully_connected/BatchNorm/beta*
validate_shape(*
_output_shapes
:
�
save_3/Assign_9Assign%fully_connected/BatchNorm/moving_meansave_3/RestoreV2:9*8
_class.
,*loc:@fully_connected/BatchNorm/moving_mean*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save_3/Assign_10Assign)fully_connected/BatchNorm/moving_variancesave_3/RestoreV2:10*
use_locking(*
T0*<
_class2
0.loc:@fully_connected/BatchNorm/moving_variance*
validate_shape(*
_output_shapes
:
�
save_3/Assign_11Assignfully_connected/weightssave_3/RestoreV2:11*
use_locking(*
T0**
_class 
loc:@fully_connected/weights*
validate_shape(*
_output_shapes

:
�
save_3/Assign_12AssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_3/RestoreV2:12*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:
�
save_3/Assign_13AssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_3/RestoreV2:13*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	�
�
save_3/Assign_14AssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_3/RestoreV2:14*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save_3/Assign_15AssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_3/RestoreV2:15*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	�
�
save_3/Assign_16AssignPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_3/RestoreV2:16*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:
�
save_3/Assign_17AssignRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_3/RestoreV2:17*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes

:*
use_locking(*
T0
�
save_3/Assign_18AssignPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_3/RestoreV2:18*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias
�
save_3/Assign_19AssignRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_3/RestoreV2:19*
_output_shapes

:*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(
�
save_3/Assign_20AssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_3/RestoreV2:20*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_3/Assign_21AssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_3/RestoreV2:21*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	D�*
use_locking(*
T0
�
save_3/Assign_22AssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_3/RestoreV2:22*
validate_shape(*
_output_shapes	
:�*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias
�
save_3/Assign_23AssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_3/RestoreV2:23*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	D�
�
save_3/Assign_24AssignPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_3/RestoreV2:24*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_3/Assign_25AssignRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_3/RestoreV2:25*
validate_shape(* 
_output_shapes
:
��*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
save_3/Assign_26AssignPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_3/RestoreV2:26*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_3/Assign_27AssignRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_3/RestoreV2:27* 
_output_shapes
:
��*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(
�
save_3/restore_shardNoOp^save_3/Assign^save_3/Assign_1^save_3/Assign_2^save_3/Assign_3^save_3/Assign_4^save_3/Assign_5^save_3/Assign_6^save_3/Assign_7^save_3/Assign_8^save_3/Assign_9^save_3/Assign_10^save_3/Assign_11^save_3/Assign_12^save_3/Assign_13^save_3/Assign_14^save_3/Assign_15^save_3/Assign_16^save_3/Assign_17^save_3/Assign_18^save_3/Assign_19^save_3/Assign_20^save_3/Assign_21^save_3/Assign_22^save_3/Assign_23^save_3/Assign_24^save_3/Assign_25^save_3/Assign_26^save_3/Assign_27
1
save_3/restore_allNoOp^save_3/restore_shard
�
init_3NoOp^conv1/weights/Assign^conv1/BatchNorm/beta/Assign#^conv1/BatchNorm/moving_mean/Assign'^conv1/BatchNorm/moving_variance/Assign\^lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign\^lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign^fully_connected/weights/Assign&^fully_connected/BatchNorm/beta/Assign-^fully_connected/BatchNorm/moving_mean/Assign1^fully_connected/BatchNorm/moving_variance/Assign\^lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign\^lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign^ctc_loss_1/w/Assign^ctc_loss_1/b/Assign^ctc_loss_1/w1/Assign^ctc_loss_1/b1/Assign
R
save_4/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
�
save_4/StringJoin/inputs_1Const*<
value3B1 B+_temp_68d4273532ab4bd5971e1b9029651677/part*
dtype0*
_output_shapes
: 
{
save_4/StringJoin
StringJoinsave_4/Constsave_4/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
S
save_4/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
^
save_4/ShardedFilename/shardConst*
dtype0*
_output_shapes
: *
value	B : 
�
save_4/ShardedFilenameShardedFilenamesave_4/StringJoinsave_4/ShardedFilename/shardsave_4/num_shards*
_output_shapes
: 
�
save_4/SaveV2/tensor_namesConst*�
value�B�Bconv1/BatchNorm/betaBconv1/BatchNorm/moving_meanBconv1/BatchNorm/moving_varianceBconv1/weightsBctc_loss_1/bBctc_loss_1/b1Bctc_loss_1/wBctc_loss_1/w1Bfully_connected/BatchNorm/betaB%fully_connected/BatchNorm/moving_meanB)fully_connected/BatchNorm/moving_varianceBfully_connected/weightsBRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:
�
save_4/SaveV2/shape_and_slicesConst*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save_4/SaveV2SaveV2save_4/ShardedFilenamesave_4/SaveV2/tensor_namessave_4/SaveV2/shape_and_slicesconv1/BatchNorm/betaconv1/BatchNorm/moving_meanconv1/BatchNorm/moving_varianceconv1/weightsctc_loss_1/bctc_loss_1/b1ctc_loss_1/wctc_loss_1/w1fully_connected/BatchNorm/beta%fully_connected/BatchNorm/moving_mean)fully_connected/BatchNorm/moving_variancefully_connected/weightsRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel**
dtypes 
2
�
save_4/control_dependencyIdentitysave_4/ShardedFilename^save_4/SaveV2*)
_class
loc:@save_4/ShardedFilename*
_output_shapes
: *
T0
�
-save_4/MergeV2Checkpoints/checkpoint_prefixesPacksave_4/ShardedFilename^save_4/control_dependency*

axis *
N*
_output_shapes
:*
T0
�
save_4/MergeV2CheckpointsMergeV2Checkpoints-save_4/MergeV2Checkpoints/checkpoint_prefixessave_4/Const*
delete_old_dirs(
�
save_4/IdentityIdentitysave_4/Const^save_4/control_dependency^save_4/MergeV2Checkpoints*
T0*
_output_shapes
: 
�
save_4/RestoreV2/tensor_namesConst*�
value�B�Bconv1/BatchNorm/betaBconv1/BatchNorm/moving_meanBconv1/BatchNorm/moving_varianceBconv1/weightsBctc_loss_1/bBctc_loss_1/b1Bctc_loss_1/wBctc_loss_1/w1Bfully_connected/BatchNorm/betaB%fully_connected/BatchNorm/moving_meanB)fully_connected/BatchNorm/moving_varianceBfully_connected/weightsBRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:
�
!save_4/RestoreV2/shape_and_slicesConst*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save_4/RestoreV2	RestoreV2save_4/Constsave_4/RestoreV2/tensor_names!save_4/RestoreV2/shape_and_slices*�
_output_shapesr
p::::::::::::::::::::::::::::**
dtypes 
2
�
save_4/AssignAssignconv1/BatchNorm/betasave_4/RestoreV2*'
_class
loc:@conv1/BatchNorm/beta*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save_4/Assign_1Assignconv1/BatchNorm/moving_meansave_4/RestoreV2:1*.
_class$
" loc:@conv1/BatchNorm/moving_mean*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save_4/Assign_2Assignconv1/BatchNorm/moving_variancesave_4/RestoreV2:2*
use_locking(*
T0*2
_class(
&$loc:@conv1/BatchNorm/moving_variance*
validate_shape(*
_output_shapes
:
�
save_4/Assign_3Assignconv1/weightssave_4/RestoreV2:3*
use_locking(*
T0* 
_class
loc:@conv1/weights*
validate_shape(*&
_output_shapes
:
�
save_4/Assign_4Assignctc_loss_1/bsave_4/RestoreV2:4*
T0*
_class
loc:@ctc_loss_1/b*
validate_shape(*
_output_shapes	
:�*
use_locking(
�
save_4/Assign_5Assignctc_loss_1/b1save_4/RestoreV2:5*
validate_shape(*
_output_shapes
:Q*
use_locking(*
T0* 
_class
loc:@ctc_loss_1/b1
�
save_4/Assign_6Assignctc_loss_1/wsave_4/RestoreV2:6*
_class
loc:@ctc_loss_1/w*
validate_shape(*
_output_shapes
:	|�*
use_locking(*
T0
�
save_4/Assign_7Assignctc_loss_1/w1save_4/RestoreV2:7*
use_locking(*
T0* 
_class
loc:@ctc_loss_1/w1*
validate_shape(*
_output_shapes
:	�Q
�
save_4/Assign_8Assignfully_connected/BatchNorm/betasave_4/RestoreV2:8*
use_locking(*
T0*1
_class'
%#loc:@fully_connected/BatchNorm/beta*
validate_shape(*
_output_shapes
:
�
save_4/Assign_9Assign%fully_connected/BatchNorm/moving_meansave_4/RestoreV2:9*
use_locking(*
T0*8
_class.
,*loc:@fully_connected/BatchNorm/moving_mean*
validate_shape(*
_output_shapes
:
�
save_4/Assign_10Assign)fully_connected/BatchNorm/moving_variancesave_4/RestoreV2:10*
use_locking(*
T0*<
_class2
0.loc:@fully_connected/BatchNorm/moving_variance*
validate_shape(*
_output_shapes
:
�
save_4/Assign_11Assignfully_connected/weightssave_4/RestoreV2:11*
_output_shapes

:*
use_locking(*
T0**
_class 
loc:@fully_connected/weights*
validate_shape(
�
save_4/Assign_12AssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_4/RestoreV2:12*
_output_shapes
:*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(
�
save_4/Assign_13AssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_4/RestoreV2:13*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	�*
use_locking(
�
save_4/Assign_14AssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_4/RestoreV2:14*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:
�
save_4/Assign_15AssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_4/RestoreV2:15*
_output_shapes
:	�*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(
�
save_4/Assign_16AssignPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_4/RestoreV2:16*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save_4/Assign_17AssignRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_4/RestoreV2:17*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes

:*
use_locking(
�
save_4/Assign_18AssignPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_4/RestoreV2:18*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:
�
save_4/Assign_19AssignRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_4/RestoreV2:19*
_output_shapes

:*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(
�
save_4/Assign_20AssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_4/RestoreV2:20*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_4/Assign_21AssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_4/RestoreV2:21*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	D�
�
save_4/Assign_22AssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_4/RestoreV2:22*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�*
use_locking(
�
save_4/Assign_23AssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_4/RestoreV2:23*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	D�
�
save_4/Assign_24AssignPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_4/RestoreV2:24*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�*
use_locking(*
T0
�
save_4/Assign_25AssignRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_4/RestoreV2:25*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(* 
_output_shapes
:
��
�
save_4/Assign_26AssignPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_4/RestoreV2:26*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_4/Assign_27AssignRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_4/RestoreV2:27*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(* 
_output_shapes
:
��*
use_locking(*
T0
�
save_4/restore_shardNoOp^save_4/Assign^save_4/Assign_1^save_4/Assign_2^save_4/Assign_3^save_4/Assign_4^save_4/Assign_5^save_4/Assign_6^save_4/Assign_7^save_4/Assign_8^save_4/Assign_9^save_4/Assign_10^save_4/Assign_11^save_4/Assign_12^save_4/Assign_13^save_4/Assign_14^save_4/Assign_15^save_4/Assign_16^save_4/Assign_17^save_4/Assign_18^save_4/Assign_19^save_4/Assign_20^save_4/Assign_21^save_4/Assign_22^save_4/Assign_23^save_4/Assign_24^save_4/Assign_25^save_4/Assign_26^save_4/Assign_27
1
save_4/restore_allNoOp^save_4/restore_shard
�
init_4NoOp^conv1/weights/Assign^conv1/BatchNorm/beta/Assign#^conv1/BatchNorm/moving_mean/Assign'^conv1/BatchNorm/moving_variance/Assign\^lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign\^lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign^fully_connected/weights/Assign&^fully_connected/BatchNorm/beta/Assign-^fully_connected/BatchNorm/moving_mean/Assign1^fully_connected/BatchNorm/moving_variance/Assign\^lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign\^lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign^ctc_loss_1/w/Assign^ctc_loss_1/b/Assign^ctc_loss_1/w1/Assign^ctc_loss_1/b1/Assign
R
save_5/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
�
save_5/StringJoin/inputs_1Const*<
value3B1 B+_temp_f068f14806244b83bda9d7e4acba0d1a/part*
dtype0*
_output_shapes
: 
{
save_5/StringJoin
StringJoinsave_5/Constsave_5/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
S
save_5/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
^
save_5/ShardedFilename/shardConst*
value	B : *
dtype0*
_output_shapes
: 
�
save_5/ShardedFilenameShardedFilenamesave_5/StringJoinsave_5/ShardedFilename/shardsave_5/num_shards*
_output_shapes
: 
�
save_5/SaveV2/tensor_namesConst*
_output_shapes
:*�
value�B�Bconv1/BatchNorm/betaBconv1/BatchNorm/moving_meanBconv1/BatchNorm/moving_varianceBconv1/weightsBctc_loss_1/bBctc_loss_1/b1Bctc_loss_1/wBctc_loss_1/w1Bfully_connected/BatchNorm/betaB%fully_connected/BatchNorm/moving_meanB)fully_connected/BatchNorm/moving_varianceBfully_connected/weightsBRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
dtype0
�
save_5/SaveV2/shape_and_slicesConst*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save_5/SaveV2SaveV2save_5/ShardedFilenamesave_5/SaveV2/tensor_namessave_5/SaveV2/shape_and_slicesconv1/BatchNorm/betaconv1/BatchNorm/moving_meanconv1/BatchNorm/moving_varianceconv1/weightsctc_loss_1/bctc_loss_1/b1ctc_loss_1/wctc_loss_1/w1fully_connected/BatchNorm/beta%fully_connected/BatchNorm/moving_mean)fully_connected/BatchNorm/moving_variancefully_connected/weightsRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel**
dtypes 
2
�
save_5/control_dependencyIdentitysave_5/ShardedFilename^save_5/SaveV2*
T0*)
_class
loc:@save_5/ShardedFilename*
_output_shapes
: 
�
-save_5/MergeV2Checkpoints/checkpoint_prefixesPacksave_5/ShardedFilename^save_5/control_dependency*
T0*

axis *
N*
_output_shapes
:
�
save_5/MergeV2CheckpointsMergeV2Checkpoints-save_5/MergeV2Checkpoints/checkpoint_prefixessave_5/Const*
delete_old_dirs(
�
save_5/IdentityIdentitysave_5/Const^save_5/control_dependency^save_5/MergeV2Checkpoints*
_output_shapes
: *
T0
�
save_5/RestoreV2/tensor_namesConst*�
value�B�Bconv1/BatchNorm/betaBconv1/BatchNorm/moving_meanBconv1/BatchNorm/moving_varianceBconv1/weightsBctc_loss_1/bBctc_loss_1/b1Bctc_loss_1/wBctc_loss_1/w1Bfully_connected/BatchNorm/betaB%fully_connected/BatchNorm/moving_meanB)fully_connected/BatchNorm/moving_varianceBfully_connected/weightsBRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:
�
!save_5/RestoreV2/shape_and_slicesConst*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save_5/RestoreV2	RestoreV2save_5/Constsave_5/RestoreV2/tensor_names!save_5/RestoreV2/shape_and_slices*�
_output_shapesr
p::::::::::::::::::::::::::::**
dtypes 
2
�
save_5/AssignAssignconv1/BatchNorm/betasave_5/RestoreV2*
use_locking(*
T0*'
_class
loc:@conv1/BatchNorm/beta*
validate_shape(*
_output_shapes
:
�
save_5/Assign_1Assignconv1/BatchNorm/moving_meansave_5/RestoreV2:1*
use_locking(*
T0*.
_class$
" loc:@conv1/BatchNorm/moving_mean*
validate_shape(*
_output_shapes
:
�
save_5/Assign_2Assignconv1/BatchNorm/moving_variancesave_5/RestoreV2:2*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*2
_class(
&$loc:@conv1/BatchNorm/moving_variance
�
save_5/Assign_3Assignconv1/weightssave_5/RestoreV2:3*
T0* 
_class
loc:@conv1/weights*
validate_shape(*&
_output_shapes
:*
use_locking(
�
save_5/Assign_4Assignctc_loss_1/bsave_5/RestoreV2:4*
use_locking(*
T0*
_class
loc:@ctc_loss_1/b*
validate_shape(*
_output_shapes	
:�
�
save_5/Assign_5Assignctc_loss_1/b1save_5/RestoreV2:5*
use_locking(*
T0* 
_class
loc:@ctc_loss_1/b1*
validate_shape(*
_output_shapes
:Q
�
save_5/Assign_6Assignctc_loss_1/wsave_5/RestoreV2:6*
_output_shapes
:	|�*
use_locking(*
T0*
_class
loc:@ctc_loss_1/w*
validate_shape(
�
save_5/Assign_7Assignctc_loss_1/w1save_5/RestoreV2:7*
use_locking(*
T0* 
_class
loc:@ctc_loss_1/w1*
validate_shape(*
_output_shapes
:	�Q
�
save_5/Assign_8Assignfully_connected/BatchNorm/betasave_5/RestoreV2:8*
_output_shapes
:*
use_locking(*
T0*1
_class'
%#loc:@fully_connected/BatchNorm/beta*
validate_shape(
�
save_5/Assign_9Assign%fully_connected/BatchNorm/moving_meansave_5/RestoreV2:9*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*8
_class.
,*loc:@fully_connected/BatchNorm/moving_mean
�
save_5/Assign_10Assign)fully_connected/BatchNorm/moving_variancesave_5/RestoreV2:10*
use_locking(*
T0*<
_class2
0.loc:@fully_connected/BatchNorm/moving_variance*
validate_shape(*
_output_shapes
:
�
save_5/Assign_11Assignfully_connected/weightssave_5/RestoreV2:11*
T0**
_class 
loc:@fully_connected/weights*
validate_shape(*
_output_shapes

:*
use_locking(
�
save_5/Assign_12AssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_5/RestoreV2:12*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save_5/Assign_13AssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_5/RestoreV2:13*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	�
�
save_5/Assign_14AssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_5/RestoreV2:14*
T0*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:*
use_locking(
�
save_5/Assign_15AssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_5/RestoreV2:15*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	�
�
save_5/Assign_16AssignPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_5/RestoreV2:16*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save_5/Assign_17AssignRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_5/RestoreV2:17*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes

:
�
save_5/Assign_18AssignPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_5/RestoreV2:18*
_output_shapes
:*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(
�
save_5/Assign_19AssignRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_5/RestoreV2:19*
_output_shapes

:*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(
�
save_5/Assign_20AssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_5/RestoreV2:20*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�*
use_locking(
�
save_5/Assign_21AssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_5/RestoreV2:21*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	D�*
use_locking(*
T0
�
save_5/Assign_22AssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_5/RestoreV2:22*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_5/Assign_23AssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_5/RestoreV2:23*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	D�*
use_locking(*
T0
�
save_5/Assign_24AssignPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_5/RestoreV2:24*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_5/Assign_25AssignRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_5/RestoreV2:25*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(* 
_output_shapes
:
��
�
save_5/Assign_26AssignPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_5/RestoreV2:26*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_5/Assign_27AssignRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_5/RestoreV2:27*
validate_shape(* 
_output_shapes
:
��*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
save_5/restore_shardNoOp^save_5/Assign^save_5/Assign_1^save_5/Assign_2^save_5/Assign_3^save_5/Assign_4^save_5/Assign_5^save_5/Assign_6^save_5/Assign_7^save_5/Assign_8^save_5/Assign_9^save_5/Assign_10^save_5/Assign_11^save_5/Assign_12^save_5/Assign_13^save_5/Assign_14^save_5/Assign_15^save_5/Assign_16^save_5/Assign_17^save_5/Assign_18^save_5/Assign_19^save_5/Assign_20^save_5/Assign_21^save_5/Assign_22^save_5/Assign_23^save_5/Assign_24^save_5/Assign_25^save_5/Assign_26^save_5/Assign_27
1
save_5/restore_allNoOp^save_5/restore_shard
�
init_5NoOp^conv1/weights/Assign^conv1/BatchNorm/beta/Assign#^conv1/BatchNorm/moving_mean/Assign'^conv1/BatchNorm/moving_variance/Assign\^lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign\^lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign^fully_connected/weights/Assign&^fully_connected/BatchNorm/beta/Assign-^fully_connected/BatchNorm/moving_mean/Assign1^fully_connected/BatchNorm/moving_variance/Assign\^lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign\^lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign^ctc_loss_1/w/Assign^ctc_loss_1/b/Assign^ctc_loss_1/w1/Assign^ctc_loss_1/b1/Assign
R
save_6/ConstConst*
_output_shapes
: *
valueB Bmodel*
dtype0
�
save_6/StringJoin/inputs_1Const*<
value3B1 B+_temp_f8260792864b482b8d79815358466b88/part*
dtype0*
_output_shapes
: 
{
save_6/StringJoin
StringJoinsave_6/Constsave_6/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
S
save_6/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
^
save_6/ShardedFilename/shardConst*
value	B : *
dtype0*
_output_shapes
: 
�
save_6/ShardedFilenameShardedFilenamesave_6/StringJoinsave_6/ShardedFilename/shardsave_6/num_shards*
_output_shapes
: 
�
save_6/SaveV2/tensor_namesConst*�
value�B�Bconv1/BatchNorm/betaBconv1/BatchNorm/moving_meanBconv1/BatchNorm/moving_varianceBconv1/weightsBctc_loss_1/bBctc_loss_1/b1Bctc_loss_1/wBctc_loss_1/w1Bfully_connected/BatchNorm/betaB%fully_connected/BatchNorm/moving_meanB)fully_connected/BatchNorm/moving_varianceBfully_connected/weightsBRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:
�
save_6/SaveV2/shape_and_slicesConst*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save_6/SaveV2SaveV2save_6/ShardedFilenamesave_6/SaveV2/tensor_namessave_6/SaveV2/shape_and_slicesconv1/BatchNorm/betaconv1/BatchNorm/moving_meanconv1/BatchNorm/moving_varianceconv1/weightsctc_loss_1/bctc_loss_1/b1ctc_loss_1/wctc_loss_1/w1fully_connected/BatchNorm/beta%fully_connected/BatchNorm/moving_mean)fully_connected/BatchNorm/moving_variancefully_connected/weightsRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel**
dtypes 
2
�
save_6/control_dependencyIdentitysave_6/ShardedFilename^save_6/SaveV2*)
_class
loc:@save_6/ShardedFilename*
_output_shapes
: *
T0
�
-save_6/MergeV2Checkpoints/checkpoint_prefixesPacksave_6/ShardedFilename^save_6/control_dependency*
T0*

axis *
N*
_output_shapes
:
�
save_6/MergeV2CheckpointsMergeV2Checkpoints-save_6/MergeV2Checkpoints/checkpoint_prefixessave_6/Const*
delete_old_dirs(
�
save_6/IdentityIdentitysave_6/Const^save_6/control_dependency^save_6/MergeV2Checkpoints*
T0*
_output_shapes
: 
�
save_6/RestoreV2/tensor_namesConst*�
value�B�Bconv1/BatchNorm/betaBconv1/BatchNorm/moving_meanBconv1/BatchNorm/moving_varianceBconv1/weightsBctc_loss_1/bBctc_loss_1/b1Bctc_loss_1/wBctc_loss_1/w1Bfully_connected/BatchNorm/betaB%fully_connected/BatchNorm/moving_meanB)fully_connected/BatchNorm/moving_varianceBfully_connected/weightsBRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:
�
!save_6/RestoreV2/shape_and_slicesConst*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save_6/RestoreV2	RestoreV2save_6/Constsave_6/RestoreV2/tensor_names!save_6/RestoreV2/shape_and_slices*�
_output_shapesr
p::::::::::::::::::::::::::::**
dtypes 
2
�
save_6/AssignAssignconv1/BatchNorm/betasave_6/RestoreV2*'
_class
loc:@conv1/BatchNorm/beta*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save_6/Assign_1Assignconv1/BatchNorm/moving_meansave_6/RestoreV2:1*
T0*.
_class$
" loc:@conv1/BatchNorm/moving_mean*
validate_shape(*
_output_shapes
:*
use_locking(
�
save_6/Assign_2Assignconv1/BatchNorm/moving_variancesave_6/RestoreV2:2*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*2
_class(
&$loc:@conv1/BatchNorm/moving_variance
�
save_6/Assign_3Assignconv1/weightssave_6/RestoreV2:3* 
_class
loc:@conv1/weights*
validate_shape(*&
_output_shapes
:*
use_locking(*
T0
�
save_6/Assign_4Assignctc_loss_1/bsave_6/RestoreV2:4*
validate_shape(*
_output_shapes	
:�*
use_locking(*
T0*
_class
loc:@ctc_loss_1/b
�
save_6/Assign_5Assignctc_loss_1/b1save_6/RestoreV2:5* 
_class
loc:@ctc_loss_1/b1*
validate_shape(*
_output_shapes
:Q*
use_locking(*
T0
�
save_6/Assign_6Assignctc_loss_1/wsave_6/RestoreV2:6*
use_locking(*
T0*
_class
loc:@ctc_loss_1/w*
validate_shape(*
_output_shapes
:	|�
�
save_6/Assign_7Assignctc_loss_1/w1save_6/RestoreV2:7*
use_locking(*
T0* 
_class
loc:@ctc_loss_1/w1*
validate_shape(*
_output_shapes
:	�Q
�
save_6/Assign_8Assignfully_connected/BatchNorm/betasave_6/RestoreV2:8*1
_class'
%#loc:@fully_connected/BatchNorm/beta*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save_6/Assign_9Assign%fully_connected/BatchNorm/moving_meansave_6/RestoreV2:9*8
_class.
,*loc:@fully_connected/BatchNorm/moving_mean*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save_6/Assign_10Assign)fully_connected/BatchNorm/moving_variancesave_6/RestoreV2:10*
use_locking(*
T0*<
_class2
0.loc:@fully_connected/BatchNorm/moving_variance*
validate_shape(*
_output_shapes
:
�
save_6/Assign_11Assignfully_connected/weightssave_6/RestoreV2:11*
T0**
_class 
loc:@fully_connected/weights*
validate_shape(*
_output_shapes

:*
use_locking(
�
save_6/Assign_12AssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_6/RestoreV2:12*
_output_shapes
:*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(
�
save_6/Assign_13AssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_6/RestoreV2:13*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	�*
use_locking(*
T0
�
save_6/Assign_14AssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_6/RestoreV2:14*
T0*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:*
use_locking(
�
save_6/Assign_15AssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_6/RestoreV2:15*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	�*
use_locking(*
T0
�
save_6/Assign_16AssignPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_6/RestoreV2:16*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:
�
save_6/Assign_17AssignRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_6/RestoreV2:17*
_output_shapes

:*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(
�
save_6/Assign_18AssignPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_6/RestoreV2:18*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:
�
save_6/Assign_19AssignRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_6/RestoreV2:19*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes

:
�
save_6/Assign_20AssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_6/RestoreV2:20*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_6/Assign_21AssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_6/RestoreV2:21*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	D�
�
save_6/Assign_22AssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_6/RestoreV2:22*
_output_shapes	
:�*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(
�
save_6/Assign_23AssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_6/RestoreV2:23*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	D�*
use_locking(
�
save_6/Assign_24AssignPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_6/RestoreV2:24*
T0*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�*
use_locking(
�
save_6/Assign_25AssignRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_6/RestoreV2:25* 
_output_shapes
:
��*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(
�
save_6/Assign_26AssignPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_6/RestoreV2:26*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_6/Assign_27AssignRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_6/RestoreV2:27*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(* 
_output_shapes
:
��
�
save_6/restore_shardNoOp^save_6/Assign^save_6/Assign_1^save_6/Assign_2^save_6/Assign_3^save_6/Assign_4^save_6/Assign_5^save_6/Assign_6^save_6/Assign_7^save_6/Assign_8^save_6/Assign_9^save_6/Assign_10^save_6/Assign_11^save_6/Assign_12^save_6/Assign_13^save_6/Assign_14^save_6/Assign_15^save_6/Assign_16^save_6/Assign_17^save_6/Assign_18^save_6/Assign_19^save_6/Assign_20^save_6/Assign_21^save_6/Assign_22^save_6/Assign_23^save_6/Assign_24^save_6/Assign_25^save_6/Assign_26^save_6/Assign_27
1
save_6/restore_allNoOp^save_6/restore_shard
�
init_6NoOp^conv1/weights/Assign^conv1/BatchNorm/beta/Assign#^conv1/BatchNorm/moving_mean/Assign'^conv1/BatchNorm/moving_variance/Assign\^lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign\^lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign^fully_connected/weights/Assign&^fully_connected/BatchNorm/beta/Assign-^fully_connected/BatchNorm/moving_mean/Assign1^fully_connected/BatchNorm/moving_variance/Assign\^lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign\^lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign^ctc_loss_1/w/Assign^ctc_loss_1/b/Assign^ctc_loss_1/w1/Assign^ctc_loss_1/b1/Assign
R
save_7/ConstConst*
dtype0*
_output_shapes
: *
valueB Bmodel
�
save_7/StringJoin/inputs_1Const*<
value3B1 B+_temp_2e1044793a8540b298311d8a4fbba454/part*
dtype0*
_output_shapes
: 
{
save_7/StringJoin
StringJoinsave_7/Constsave_7/StringJoin/inputs_1*
	separator *
N*
_output_shapes
: 
S
save_7/num_shardsConst*
_output_shapes
: *
value	B :*
dtype0
^
save_7/ShardedFilename/shardConst*
value	B : *
dtype0*
_output_shapes
: 
�
save_7/ShardedFilenameShardedFilenamesave_7/StringJoinsave_7/ShardedFilename/shardsave_7/num_shards*
_output_shapes
: 
�
save_7/SaveV2/tensor_namesConst*�
value�B�Bconv1/BatchNorm/betaBconv1/BatchNorm/moving_meanBconv1/BatchNorm/moving_varianceBconv1/weightsBctc_loss_1/bBctc_loss_1/b1Bctc_loss_1/wBctc_loss_1/w1Bfully_connected/BatchNorm/betaB%fully_connected/BatchNorm/moving_meanB)fully_connected/BatchNorm/moving_varianceBfully_connected/weightsBRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:
�
save_7/SaveV2/shape_and_slicesConst*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save_7/SaveV2SaveV2save_7/ShardedFilenamesave_7/SaveV2/tensor_namessave_7/SaveV2/shape_and_slicesconv1/BatchNorm/betaconv1/BatchNorm/moving_meanconv1/BatchNorm/moving_varianceconv1/weightsctc_loss_1/bctc_loss_1/b1ctc_loss_1/wctc_loss_1/w1fully_connected/BatchNorm/beta%fully_connected/BatchNorm/moving_mean)fully_connected/BatchNorm/moving_variancefully_connected/weightsRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel**
dtypes 
2
�
save_7/control_dependencyIdentitysave_7/ShardedFilename^save_7/SaveV2*
T0*)
_class
loc:@save_7/ShardedFilename*
_output_shapes
: 
�
-save_7/MergeV2Checkpoints/checkpoint_prefixesPacksave_7/ShardedFilename^save_7/control_dependency*
_output_shapes
:*
T0*

axis *
N
�
save_7/MergeV2CheckpointsMergeV2Checkpoints-save_7/MergeV2Checkpoints/checkpoint_prefixessave_7/Const*
delete_old_dirs(
�
save_7/IdentityIdentitysave_7/Const^save_7/control_dependency^save_7/MergeV2Checkpoints*
T0*
_output_shapes
: 
�
save_7/RestoreV2/tensor_namesConst*�
value�B�Bconv1/BatchNorm/betaBconv1/BatchNorm/moving_meanBconv1/BatchNorm/moving_varianceBconv1/weightsBctc_loss_1/bBctc_loss_1/b1Bctc_loss_1/wBctc_loss_1/w1Bfully_connected/BatchNorm/betaB%fully_connected/BatchNorm/moving_meanB)fully_connected/BatchNorm/moving_varianceBfully_connected/weightsBRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:
�
!save_7/RestoreV2/shape_and_slicesConst*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save_7/RestoreV2	RestoreV2save_7/Constsave_7/RestoreV2/tensor_names!save_7/RestoreV2/shape_and_slices*�
_output_shapesr
p::::::::::::::::::::::::::::**
dtypes 
2
�
save_7/AssignAssignconv1/BatchNorm/betasave_7/RestoreV2*
use_locking(*
T0*'
_class
loc:@conv1/BatchNorm/beta*
validate_shape(*
_output_shapes
:
�
save_7/Assign_1Assignconv1/BatchNorm/moving_meansave_7/RestoreV2:1*
use_locking(*
T0*.
_class$
" loc:@conv1/BatchNorm/moving_mean*
validate_shape(*
_output_shapes
:
�
save_7/Assign_2Assignconv1/BatchNorm/moving_variancesave_7/RestoreV2:2*
use_locking(*
T0*2
_class(
&$loc:@conv1/BatchNorm/moving_variance*
validate_shape(*
_output_shapes
:
�
save_7/Assign_3Assignconv1/weightssave_7/RestoreV2:3*
use_locking(*
T0* 
_class
loc:@conv1/weights*
validate_shape(*&
_output_shapes
:
�
save_7/Assign_4Assignctc_loss_1/bsave_7/RestoreV2:4*
use_locking(*
T0*
_class
loc:@ctc_loss_1/b*
validate_shape(*
_output_shapes	
:�
�
save_7/Assign_5Assignctc_loss_1/b1save_7/RestoreV2:5*
use_locking(*
T0* 
_class
loc:@ctc_loss_1/b1*
validate_shape(*
_output_shapes
:Q
�
save_7/Assign_6Assignctc_loss_1/wsave_7/RestoreV2:6*
use_locking(*
T0*
_class
loc:@ctc_loss_1/w*
validate_shape(*
_output_shapes
:	|�
�
save_7/Assign_7Assignctc_loss_1/w1save_7/RestoreV2:7*
_output_shapes
:	�Q*
use_locking(*
T0* 
_class
loc:@ctc_loss_1/w1*
validate_shape(
�
save_7/Assign_8Assignfully_connected/BatchNorm/betasave_7/RestoreV2:8*
use_locking(*
T0*1
_class'
%#loc:@fully_connected/BatchNorm/beta*
validate_shape(*
_output_shapes
:
�
save_7/Assign_9Assign%fully_connected/BatchNorm/moving_meansave_7/RestoreV2:9*
use_locking(*
T0*8
_class.
,*loc:@fully_connected/BatchNorm/moving_mean*
validate_shape(*
_output_shapes
:
�
save_7/Assign_10Assign)fully_connected/BatchNorm/moving_variancesave_7/RestoreV2:10*<
_class2
0.loc:@fully_connected/BatchNorm/moving_variance*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save_7/Assign_11Assignfully_connected/weightssave_7/RestoreV2:11*
use_locking(*
T0**
_class 
loc:@fully_connected/weights*
validate_shape(*
_output_shapes

:
�
save_7/Assign_12AssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_7/RestoreV2:12*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:
�
save_7/Assign_13AssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_7/RestoreV2:13*
_output_shapes
:	�*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(
�
save_7/Assign_14AssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_7/RestoreV2:14*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save_7/Assign_15AssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_7/RestoreV2:15*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	�*
use_locking(
�
save_7/Assign_16AssignPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_7/RestoreV2:16*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save_7/Assign_17AssignRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_7/RestoreV2:17*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes

:
�
save_7/Assign_18AssignPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_7/RestoreV2:18*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save_7/Assign_19AssignRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_7/RestoreV2:19*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes

:*
use_locking(
�
save_7/Assign_20AssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_7/RestoreV2:20*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_7/Assign_21AssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_7/RestoreV2:21*
validate_shape(*
_output_shapes
:	D�*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
save_7/Assign_22AssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_7/RestoreV2:22*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�*
use_locking(*
T0
�
save_7/Assign_23AssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_7/RestoreV2:23*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	D�
�
save_7/Assign_24AssignPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_7/RestoreV2:24*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_7/Assign_25AssignRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_7/RestoreV2:25*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(* 
_output_shapes
:
��*
use_locking(
�
save_7/Assign_26AssignPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_7/RestoreV2:26*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_7/Assign_27AssignRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_7/RestoreV2:27*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(* 
_output_shapes
:
��*
use_locking(*
T0
�
save_7/restore_shardNoOp^save_7/Assign^save_7/Assign_1^save_7/Assign_2^save_7/Assign_3^save_7/Assign_4^save_7/Assign_5^save_7/Assign_6^save_7/Assign_7^save_7/Assign_8^save_7/Assign_9^save_7/Assign_10^save_7/Assign_11^save_7/Assign_12^save_7/Assign_13^save_7/Assign_14^save_7/Assign_15^save_7/Assign_16^save_7/Assign_17^save_7/Assign_18^save_7/Assign_19^save_7/Assign_20^save_7/Assign_21^save_7/Assign_22^save_7/Assign_23^save_7/Assign_24^save_7/Assign_25^save_7/Assign_26^save_7/Assign_27
1
save_7/restore_allNoOp^save_7/restore_shard
�
init_7NoOp^conv1/weights/Assign^conv1/BatchNorm/beta/Assign#^conv1/BatchNorm/moving_mean/Assign'^conv1/BatchNorm/moving_variance/Assign\^lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign\^lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign^fully_connected/weights/Assign&^fully_connected/BatchNorm/beta/Assign-^fully_connected/BatchNorm/moving_mean/Assign1^fully_connected/BatchNorm/moving_variance/Assign\^lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign\^lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign^ctc_loss_1/w/Assign^ctc_loss_1/b/Assign^ctc_loss_1/w1/Assign^ctc_loss_1/b1/Assign
R
save_8/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
�
save_8/StringJoin/inputs_1Const*<
value3B1 B+_temp_b8291dffb36f4ea1a82200ac88f11bee/part*
dtype0*
_output_shapes
: 
{
save_8/StringJoin
StringJoinsave_8/Constsave_8/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
S
save_8/num_shardsConst*
_output_shapes
: *
value	B :*
dtype0
^
save_8/ShardedFilename/shardConst*
value	B : *
dtype0*
_output_shapes
: 
�
save_8/ShardedFilenameShardedFilenamesave_8/StringJoinsave_8/ShardedFilename/shardsave_8/num_shards*
_output_shapes
: 
�
save_8/SaveV2/tensor_namesConst*�
value�B�Bconv1/BatchNorm/betaBconv1/BatchNorm/moving_meanBconv1/BatchNorm/moving_varianceBconv1/weightsBctc_loss_1/bBctc_loss_1/b1Bctc_loss_1/wBctc_loss_1/w1Bfully_connected/BatchNorm/betaB%fully_connected/BatchNorm/moving_meanB)fully_connected/BatchNorm/moving_varianceBfully_connected/weightsBRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:
�
save_8/SaveV2/shape_and_slicesConst*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save_8/SaveV2SaveV2save_8/ShardedFilenamesave_8/SaveV2/tensor_namessave_8/SaveV2/shape_and_slicesconv1/BatchNorm/betaconv1/BatchNorm/moving_meanconv1/BatchNorm/moving_varianceconv1/weightsctc_loss_1/bctc_loss_1/b1ctc_loss_1/wctc_loss_1/w1fully_connected/BatchNorm/beta%fully_connected/BatchNorm/moving_mean)fully_connected/BatchNorm/moving_variancefully_connected/weightsRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel**
dtypes 
2
�
save_8/control_dependencyIdentitysave_8/ShardedFilename^save_8/SaveV2*
T0*)
_class
loc:@save_8/ShardedFilename*
_output_shapes
: 
�
-save_8/MergeV2Checkpoints/checkpoint_prefixesPacksave_8/ShardedFilename^save_8/control_dependency*
T0*

axis *
N*
_output_shapes
:
�
save_8/MergeV2CheckpointsMergeV2Checkpoints-save_8/MergeV2Checkpoints/checkpoint_prefixessave_8/Const*
delete_old_dirs(
�
save_8/IdentityIdentitysave_8/Const^save_8/control_dependency^save_8/MergeV2Checkpoints*
T0*
_output_shapes
: 
�
save_8/RestoreV2/tensor_namesConst*�
value�B�Bconv1/BatchNorm/betaBconv1/BatchNorm/moving_meanBconv1/BatchNorm/moving_varianceBconv1/weightsBctc_loss_1/bBctc_loss_1/b1Bctc_loss_1/wBctc_loss_1/w1Bfully_connected/BatchNorm/betaB%fully_connected/BatchNorm/moving_meanB)fully_connected/BatchNorm/moving_varianceBfully_connected/weightsBRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:
�
!save_8/RestoreV2/shape_and_slicesConst*
_output_shapes
:*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
�
save_8/RestoreV2	RestoreV2save_8/Constsave_8/RestoreV2/tensor_names!save_8/RestoreV2/shape_and_slices*�
_output_shapesr
p::::::::::::::::::::::::::::**
dtypes 
2
�
save_8/AssignAssignconv1/BatchNorm/betasave_8/RestoreV2*
use_locking(*
T0*'
_class
loc:@conv1/BatchNorm/beta*
validate_shape(*
_output_shapes
:
�
save_8/Assign_1Assignconv1/BatchNorm/moving_meansave_8/RestoreV2:1*
T0*.
_class$
" loc:@conv1/BatchNorm/moving_mean*
validate_shape(*
_output_shapes
:*
use_locking(
�
save_8/Assign_2Assignconv1/BatchNorm/moving_variancesave_8/RestoreV2:2*
use_locking(*
T0*2
_class(
&$loc:@conv1/BatchNorm/moving_variance*
validate_shape(*
_output_shapes
:
�
save_8/Assign_3Assignconv1/weightssave_8/RestoreV2:3*
validate_shape(*&
_output_shapes
:*
use_locking(*
T0* 
_class
loc:@conv1/weights
�
save_8/Assign_4Assignctc_loss_1/bsave_8/RestoreV2:4*
use_locking(*
T0*
_class
loc:@ctc_loss_1/b*
validate_shape(*
_output_shapes	
:�
�
save_8/Assign_5Assignctc_loss_1/b1save_8/RestoreV2:5*
_output_shapes
:Q*
use_locking(*
T0* 
_class
loc:@ctc_loss_1/b1*
validate_shape(
�
save_8/Assign_6Assignctc_loss_1/wsave_8/RestoreV2:6*
validate_shape(*
_output_shapes
:	|�*
use_locking(*
T0*
_class
loc:@ctc_loss_1/w
�
save_8/Assign_7Assignctc_loss_1/w1save_8/RestoreV2:7*
use_locking(*
T0* 
_class
loc:@ctc_loss_1/w1*
validate_shape(*
_output_shapes
:	�Q
�
save_8/Assign_8Assignfully_connected/BatchNorm/betasave_8/RestoreV2:8*
use_locking(*
T0*1
_class'
%#loc:@fully_connected/BatchNorm/beta*
validate_shape(*
_output_shapes
:
�
save_8/Assign_9Assign%fully_connected/BatchNorm/moving_meansave_8/RestoreV2:9*
use_locking(*
T0*8
_class.
,*loc:@fully_connected/BatchNorm/moving_mean*
validate_shape(*
_output_shapes
:
�
save_8/Assign_10Assign)fully_connected/BatchNorm/moving_variancesave_8/RestoreV2:10*
use_locking(*
T0*<
_class2
0.loc:@fully_connected/BatchNorm/moving_variance*
validate_shape(*
_output_shapes
:
�
save_8/Assign_11Assignfully_connected/weightssave_8/RestoreV2:11*
use_locking(*
T0**
_class 
loc:@fully_connected/weights*
validate_shape(*
_output_shapes

:
�
save_8/Assign_12AssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_8/RestoreV2:12*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:
�
save_8/Assign_13AssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_8/RestoreV2:13*
validate_shape(*
_output_shapes
:	�*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
save_8/Assign_14AssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_8/RestoreV2:14*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:
�
save_8/Assign_15AssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_8/RestoreV2:15*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	�
�
save_8/Assign_16AssignPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_8/RestoreV2:16*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:
�
save_8/Assign_17AssignRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_8/RestoreV2:17*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes

:
�
save_8/Assign_18AssignPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_8/RestoreV2:18*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:
�
save_8/Assign_19AssignRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_8/RestoreV2:19*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes

:
�
save_8/Assign_20AssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_8/RestoreV2:20*
validate_shape(*
_output_shapes	
:�*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias
�
save_8/Assign_21AssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_8/RestoreV2:21*
_output_shapes
:	D�*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(
�
save_8/Assign_22AssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_8/RestoreV2:22*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_8/Assign_23AssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_8/RestoreV2:23*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	D�
�
save_8/Assign_24AssignPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_8/RestoreV2:24*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�*
use_locking(*
T0
�
save_8/Assign_25AssignRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_8/RestoreV2:25*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(* 
_output_shapes
:
��
�
save_8/Assign_26AssignPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_8/RestoreV2:26*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_8/Assign_27AssignRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_8/RestoreV2:27*
validate_shape(* 
_output_shapes
:
��*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel
�
save_8/restore_shardNoOp^save_8/Assign^save_8/Assign_1^save_8/Assign_2^save_8/Assign_3^save_8/Assign_4^save_8/Assign_5^save_8/Assign_6^save_8/Assign_7^save_8/Assign_8^save_8/Assign_9^save_8/Assign_10^save_8/Assign_11^save_8/Assign_12^save_8/Assign_13^save_8/Assign_14^save_8/Assign_15^save_8/Assign_16^save_8/Assign_17^save_8/Assign_18^save_8/Assign_19^save_8/Assign_20^save_8/Assign_21^save_8/Assign_22^save_8/Assign_23^save_8/Assign_24^save_8/Assign_25^save_8/Assign_26^save_8/Assign_27
1
save_8/restore_allNoOp^save_8/restore_shard
�
init_8NoOp^conv1/weights/Assign^conv1/BatchNorm/beta/Assign#^conv1/BatchNorm/moving_mean/Assign'^conv1/BatchNorm/moving_variance/Assign\^lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign\^lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign^fully_connected/weights/Assign&^fully_connected/BatchNorm/beta/Assign-^fully_connected/BatchNorm/moving_mean/Assign1^fully_connected/BatchNorm/moving_variance/Assign\^lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign\^lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignZ^lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignZ^lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignX^lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Assign^ctc_loss_1/w/Assign^ctc_loss_1/b/Assign^ctc_loss_1/w1/Assign^ctc_loss_1/b1/Assign
R
save_9/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
�
save_9/StringJoin/inputs_1Const*<
value3B1 B+_temp_140631b35f0b466694d9ab944034e59e/part*
dtype0*
_output_shapes
: 
{
save_9/StringJoin
StringJoinsave_9/Constsave_9/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
S
save_9/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
^
save_9/ShardedFilename/shardConst*
value	B : *
dtype0*
_output_shapes
: 
�
save_9/ShardedFilenameShardedFilenamesave_9/StringJoinsave_9/ShardedFilename/shardsave_9/num_shards*
_output_shapes
: 
�
save_9/SaveV2/tensor_namesConst*�
value�B�Bconv1/BatchNorm/betaBconv1/BatchNorm/moving_meanBconv1/BatchNorm/moving_varianceBconv1/weightsBctc_loss_1/bBctc_loss_1/b1Bctc_loss_1/wBctc_loss_1/w1Bfully_connected/BatchNorm/betaB%fully_connected/BatchNorm/moving_meanB)fully_connected/BatchNorm/moving_varianceBfully_connected/weightsBRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:
�
save_9/SaveV2/shape_and_slicesConst*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save_9/SaveV2SaveV2save_9/ShardedFilenamesave_9/SaveV2/tensor_namessave_9/SaveV2/shape_and_slicesconv1/BatchNorm/betaconv1/BatchNorm/moving_meanconv1/BatchNorm/moving_varianceconv1/weightsctc_loss_1/bctc_loss_1/b1ctc_loss_1/wctc_loss_1/w1fully_connected/BatchNorm/beta%fully_connected/BatchNorm/moving_mean)fully_connected/BatchNorm/moving_variancefully_connected/weightsRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel**
dtypes 
2
�
save_9/control_dependencyIdentitysave_9/ShardedFilename^save_9/SaveV2*
_output_shapes
: *
T0*)
_class
loc:@save_9/ShardedFilename
�
-save_9/MergeV2Checkpoints/checkpoint_prefixesPacksave_9/ShardedFilename^save_9/control_dependency*
T0*

axis *
N*
_output_shapes
:
�
save_9/MergeV2CheckpointsMergeV2Checkpoints-save_9/MergeV2Checkpoints/checkpoint_prefixessave_9/Const*
delete_old_dirs(
�
save_9/IdentityIdentitysave_9/Const^save_9/control_dependency^save_9/MergeV2Checkpoints*
T0*
_output_shapes
: 
�
save_9/RestoreV2/tensor_namesConst*�
value�B�Bconv1/BatchNorm/betaBconv1/BatchNorm/moving_meanBconv1/BatchNorm/moving_varianceBconv1/weightsBctc_loss_1/bBctc_loss_1/b1Bctc_loss_1/wBctc_loss_1/w1Bfully_connected/BatchNorm/betaB%fully_connected/BatchNorm/moving_meanB)fully_connected/BatchNorm/moving_varianceBfully_connected/weightsBRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelBPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biasBRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:
�
!save_9/RestoreV2/shape_and_slicesConst*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save_9/RestoreV2	RestoreV2save_9/Constsave_9/RestoreV2/tensor_names!save_9/RestoreV2/shape_and_slices*�
_output_shapesr
p::::::::::::::::::::::::::::**
dtypes 
2
�
save_9/AssignAssignconv1/BatchNorm/betasave_9/RestoreV2*
use_locking(*
T0*'
_class
loc:@conv1/BatchNorm/beta*
validate_shape(*
_output_shapes
:
�
save_9/Assign_1Assignconv1/BatchNorm/moving_meansave_9/RestoreV2:1*
use_locking(*
T0*.
_class$
" loc:@conv1/BatchNorm/moving_mean*
validate_shape(*
_output_shapes
:
�
save_9/Assign_2Assignconv1/BatchNorm/moving_variancesave_9/RestoreV2:2*
T0*2
_class(
&$loc:@conv1/BatchNorm/moving_variance*
validate_shape(*
_output_shapes
:*
use_locking(
�
save_9/Assign_3Assignconv1/weightssave_9/RestoreV2:3*
use_locking(*
T0* 
_class
loc:@conv1/weights*
validate_shape(*&
_output_shapes
:
�
save_9/Assign_4Assignctc_loss_1/bsave_9/RestoreV2:4*
use_locking(*
T0*
_class
loc:@ctc_loss_1/b*
validate_shape(*
_output_shapes	
:�
�
save_9/Assign_5Assignctc_loss_1/b1save_9/RestoreV2:5*
use_locking(*
T0* 
_class
loc:@ctc_loss_1/b1*
validate_shape(*
_output_shapes
:Q
�
save_9/Assign_6Assignctc_loss_1/wsave_9/RestoreV2:6*
use_locking(*
T0*
_class
loc:@ctc_loss_1/w*
validate_shape(*
_output_shapes
:	|�
�
save_9/Assign_7Assignctc_loss_1/w1save_9/RestoreV2:7*
use_locking(*
T0* 
_class
loc:@ctc_loss_1/w1*
validate_shape(*
_output_shapes
:	�Q
�
save_9/Assign_8Assignfully_connected/BatchNorm/betasave_9/RestoreV2:8*
use_locking(*
T0*1
_class'
%#loc:@fully_connected/BatchNorm/beta*
validate_shape(*
_output_shapes
:
�
save_9/Assign_9Assign%fully_connected/BatchNorm/moving_meansave_9/RestoreV2:9*
use_locking(*
T0*8
_class.
,*loc:@fully_connected/BatchNorm/moving_mean*
validate_shape(*
_output_shapes
:
�
save_9/Assign_10Assign)fully_connected/BatchNorm/moving_variancesave_9/RestoreV2:10*
use_locking(*
T0*<
_class2
0.loc:@fully_connected/BatchNorm/moving_variance*
validate_shape(*
_output_shapes
:
�
save_9/Assign_11Assignfully_connected/weightssave_9/RestoreV2:11*
T0**
_class 
loc:@fully_connected/weights*
validate_shape(*
_output_shapes

:*
use_locking(
�
save_9/Assign_12AssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_9/RestoreV2:12*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias
�
save_9/Assign_13AssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_9/RestoreV2:13*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	�
�
save_9/Assign_14AssignRlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_9/RestoreV2:14*e
_class[
YWloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save_9/Assign_15AssignTlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_9/RestoreV2:15*g
_class]
[Yloc:@lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	�*
use_locking(*
T0
�
save_9/Assign_16AssignPlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_9/RestoreV2:16*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes
:
�
save_9/Assign_17AssignRlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_9/RestoreV2:17*
T0*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes

:*
use_locking(
�
save_9/Assign_18AssignPlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_9/RestoreV2:18*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias
�
save_9/Assign_19AssignRlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_9/RestoreV2:19*e
_class[
YWloc:@lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes

:*
use_locking(*
T0
�
save_9/Assign_20AssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_9/RestoreV2:20*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_9/Assign_21AssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_9/RestoreV2:21*
_output_shapes
:	D�*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(
�
save_9/Assign_22AssignRlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_9/RestoreV2:22*e
_class[
YWloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�*
use_locking(*
T0
�
save_9/Assign_23AssignTlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_9/RestoreV2:23*
use_locking(*
T0*g
_class]
[Yloc:@lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(*
_output_shapes
:	D�
�
save_9/Assign_24AssignPlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/biassave_9/RestoreV2:24*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�*
use_locking(*
T0
�
save_9/Assign_25AssignRlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_9/RestoreV2:25*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(* 
_output_shapes
:
��
�
save_9/Assign_26AssignPlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/biassave_9/RestoreV2:26*
use_locking(*
T0*c
_classY
WUloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias*
validate_shape(*
_output_shapes	
:�
�
save_9/Assign_27AssignRlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernelsave_9/RestoreV2:27*
use_locking(*
T0*e
_class[
YWloc:@lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel*
validate_shape(* 
_output_shapes
:
��
�
save_9/restore_shardNoOp^save_9/Assign^save_9/Assign_1^save_9/Assign_2^save_9/Assign_3^save_9/Assign_4^save_9/Assign_5^save_9/Assign_6^save_9/Assign_7^save_9/Assign_8^save_9/Assign_9^save_9/Assign_10^save_9/Assign_11^save_9/Assign_12^save_9/Assign_13^save_9/Assign_14^save_9/Assign_15^save_9/Assign_16^save_9/Assign_17^save_9/Assign_18^save_9/Assign_19^save_9/Assign_20^save_9/Assign_21^save_9/Assign_22^save_9/Assign_23^save_9/Assign_24^save_9/Assign_25^save_9/Assign_26^save_9/Assign_27
1
save_9/restore_allNoOp^save_9/restore_shard "B
save_9/Const:0save_9/Identity:0save_9/restore_all (5 @F8"�
	summaries�
�
model/Train/histogram-b-ctc:0
model/Train/histogram-w-ctc:0
model/conv1/weights:0
model/conv1/BatchNorm/beta:0
#model/conv1/BatchNorm/moving_mean:0
'model/conv1/BatchNorm/moving_variance:0
model/fully_connected/weights:0
&model/fully_connected/BatchNorm/beta:0
-model/fully_connected/BatchNorm/moving_mean:0
1model/fully_connected/BatchNorm/moving_variance:0"�7
trainable_variables�7�7
i
conv1/weights:0conv1/weights/Assignconv1/weights/read:02*conv1/weights/Initializer/random_uniform:0
|
conv1/BatchNorm/beta:0conv1/BatchNorm/beta/Assignconv1/BatchNorm/beta/read:02(conv1/BatchNorm/beta/Initializer/zeros:0
�
Vlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel:0[lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Assign[lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:02qlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform:0
�
Tlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias:0Ylstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignYlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:02flstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros:0
�
Vlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel:0[lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Assign[lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:02qlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform:0
�
Tlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias:0Ylstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignYlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:02flstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros:0
�
Tlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel:0Ylstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignYlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:02olstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform:0
�
Rlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias:0Wlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignWlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:02dlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros:0
�
Tlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel:0Ylstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignYlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:02olstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform:0
�
Rlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias:0Wlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignWlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:02dlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros:0
�
fully_connected/weights:0fully_connected/weights/Assignfully_connected/weights/read:024fully_connected/weights/Initializer/random_uniform:0
�
 fully_connected/BatchNorm/beta:0%fully_connected/BatchNorm/beta/Assign%fully_connected/BatchNorm/beta/read:022fully_connected/BatchNorm/beta/Initializer/zeros:0
�
Vlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel:0[lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Assign[lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:02qlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform:0
�
Tlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias:0Ylstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignYlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:02flstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros:0
�
Vlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel:0[lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Assign[lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:02qlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform:0
�
Tlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias:0Ylstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignYlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:02flstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros:0
�
Tlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel:0Ylstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignYlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:02olstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform:0
�
Rlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias:0Wlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignWlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:02dlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros:0
�
Tlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel:0Ylstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignYlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:02olstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform:0
�
Rlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias:0Wlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignWlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:02dlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros:0
g
ctc_loss_1/w:0ctc_loss_1/w/Assignctc_loss_1/w/read:02+ctc_loss_1/w/Initializer/truncated_normal:0
g
ctc_loss_1/b:0ctc_loss_1/b/Assignctc_loss_1/b/read:02+ctc_loss_1/b/Initializer/truncated_normal:0
k
ctc_loss_1/w1:0ctc_loss_1/w1/Assignctc_loss_1/w1/read:02,ctc_loss_1/w1/Initializer/truncated_normal:0
k
ctc_loss_1/b1:0ctc_loss_1/b1/Assignctc_loss_1/b1/read:02,ctc_loss_1/b1/Initializer/truncated_normal:0"��
while_context����
�Y
Wmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context *Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond:02Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge:0:Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity:0BPmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit:0BRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_1:0BRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_2:0BRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_3:0BRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_4:0J�O
Ylstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:0
[lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:0
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLen:0
Mmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Minimum:0
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray:0
�model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice:0
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_1:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_2:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_3:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_4:0
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit:0
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_1:0
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_2:0
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_3:0
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_4:0
^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqual/Enter:0
Xmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqual:0
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity:0
Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1:0
Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_2:0
Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_3:0
Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_4:0
Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less/Enter:0
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less:0
Xmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1/Enter:0
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1:0
Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LogicalAnd:0
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond:0
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge:0
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge:1
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1:1
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_2:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_2:1
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_3:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_3:1
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_4:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_4:1
Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration:0
[model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_1:0
[model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_2:0
[model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_3:0
[model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_4:0
Xmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select/Enter:0
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select:0
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_1:0
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_2:0
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch:0
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch:1
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_1:0
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_1:1
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_2:0
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_2:1
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_3:0
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_3:1
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_4:0
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_4:1
cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter:0
emodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1:0
]model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3:0
umodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3:0
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add/y:0
Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1/y:0
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1:0
_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add:0
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1:0
imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter:0
cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd:0
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const:0
cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_1:0
cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2:0
hmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter:0
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul:0
_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul:0
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1:0
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2:0
cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid:0
emodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1:0
emodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2:0
`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh:0
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1:0
gmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axis:0
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concat:0
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:0
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:1
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:2
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:3
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zeros:0�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray:0umodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0�
Mmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Minimum:0Xmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1/Enter:0�
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1:0cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter:0�
[lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:0hmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter:0�
Ylstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:0imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter:0�
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice:0Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less/Enter:0�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLen:0^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqual/Enter:0�
�model/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0emodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1:0�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zeros:0Xmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select/Enter:0RQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter:0RSmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_1:0RSmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_2:0RSmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_3:0RSmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_4:0ZSmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice:0
�Y
Wmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context *Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond:02Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge:0:Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity:0BPmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit:0BRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_1:0BRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_2:0BRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_3:0BRmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_4:0J�O
Ylstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:0
[lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:0
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLen:0
Mmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Minimum:0
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray:0
�model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice:0
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_1:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_2:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_3:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_4:0
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit:0
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_1:0
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_2:0
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_3:0
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_4:0
^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqual/Enter:0
Xmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqual:0
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity:0
Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1:0
Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_2:0
Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_3:0
Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_4:0
Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less/Enter:0
Pmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less:0
Xmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1/Enter:0
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1:0
Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LogicalAnd:0
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond:0
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge:0
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge:1
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1:1
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_2:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_2:1
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_3:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_3:1
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_4:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_4:1
Ymodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration:0
[model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_1:0
[model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_2:0
[model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_3:0
[model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_4:0
Xmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select/Enter:0
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select:0
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_1:0
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_2:0
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch:0
Rmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch:1
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_1:0
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_1:1
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_2:0
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_2:1
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_3:0
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_3:1
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_4:0
Tmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_4:1
cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter:0
emodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1:0
]model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3:0
umodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3:0
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add/y:0
Omodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add:0
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1/y:0
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1:0
_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add:0
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1:0
imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter:0
cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd:0
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const:0
cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_1:0
cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2:0
hmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter:0
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul:0
_model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul:0
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1:0
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2:0
cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid:0
emodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1:0
emodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2:0
`model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh:0
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1:0
gmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axis:0
bmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concat:0
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:0
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:1
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:2
amodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:3
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zeros:0�
Kmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zeros:0Xmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select/Enter:0�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray:0umodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0�
Mmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Minimum:0Xmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1/Enter:0�
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1:0cmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter:0�
[lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:0hmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter:0�
Ylstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:0imodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter:0�
Smodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice:0Vmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less/Enter:0�
Qmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLen:0^model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqual/Enter:0�
�model/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0emodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1:0RQmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter:0RSmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_1:0RSmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_2:0RSmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_3:0RSmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_4:0ZSmodel/lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice:0
�W
Umodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context *Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond:02Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge:0:Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity:0BNmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit:0BPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_1:0BPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_2:0BPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_3:0BPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_4:0J�N
Wlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:0
Ylstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:0
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLen:0
Kmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Minimum:0
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray:0
~model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice:0
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_1:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_2:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_3:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_4:0
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit:0
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_1:0
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_2:0
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_3:0
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_4:0
\model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqual/Enter:0
Vmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqual:0
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity:0
Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1:0
Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_2:0
Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_3:0
Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_4:0
Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less/Enter:0
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less:0
Vmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1/Enter:0
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1:0
Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LogicalAnd:0
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond:0
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge:0
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge:1
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1:1
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_2:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_2:1
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_3:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_3:1
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_4:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_4:1
Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration:0
Ymodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_1:0
Ymodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_2:0
Ymodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_3:0
Ymodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_4:0
Vmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select/Enter:0
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select:0
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_1:0
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_2:0
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch:0
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch:1
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_1:0
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_1:1
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_2:0
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_2:1
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_3:0
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_3:1
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_4:0
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_4:1
amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter:0
cmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1:0
[model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3:0
smodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3:0
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add/y:0
Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1/y:0
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1:0
]model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add:0
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1:0
gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter:0
amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd:0
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const:0
amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_1:0
amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2:0
fmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter:0
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul:0
]model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul:0
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1:0
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2:0
amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid:0
cmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1:0
cmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2:0
^model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh:0
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1:0
emodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axis:0
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concat:0
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:0
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:1
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:2
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:3
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zeros:0�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zeros:0Vmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select/Enter:0�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray:0smodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0�
Kmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Minimum:0Vmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1/Enter:0�
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1:0amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter:0�
Ylstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:0fmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter:0�
Wlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:0gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter:0�
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice:0Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less/Enter:0�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLen:0\model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqual/Enter:0�
~model/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0cmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1:0ROmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter:0RQmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_1:0RQmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_2:0RQmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_3:0RQmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_4:0ZQmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice:0
�W
Umodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context *Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond:02Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge:0:Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity:0BNmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit:0BPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_1:0BPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_2:0BPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_3:0BPmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_4:0J�N
Wlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:0
Ylstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:0
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLen:0
Kmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Minimum:0
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray:0
~model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice:0
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_1:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_2:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_3:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_4:0
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit:0
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_1:0
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_2:0
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_3:0
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_4:0
\model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqual/Enter:0
Vmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqual:0
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity:0
Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1:0
Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_2:0
Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_3:0
Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_4:0
Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less/Enter:0
Nmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less:0
Vmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1/Enter:0
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1:0
Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LogicalAnd:0
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond:0
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge:0
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge:1
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1:1
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_2:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_2:1
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_3:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_3:1
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_4:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_4:1
Wmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration:0
Ymodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_1:0
Ymodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_2:0
Ymodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_3:0
Ymodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_4:0
Vmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select/Enter:0
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select:0
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_1:0
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_2:0
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch:0
Pmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch:1
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_1:0
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_1:1
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_2:0
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_2:1
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_3:0
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_3:1
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_4:0
Rmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_4:1
amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter:0
cmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1:0
[model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3:0
smodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3:0
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add/y:0
Mmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add:0
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1/y:0
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1:0
]model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add:0
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1:0
gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter:0
amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd:0
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const:0
amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_1:0
amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2:0
fmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter:0
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul:0
]model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul:0
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1:0
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2:0
amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid:0
cmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1:0
cmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2:0
^model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh:0
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1:0
emodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axis:0
`model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concat:0
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:0
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:1
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:2
_model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:3
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zeros:0�
~model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0cmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1:0�
Imodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zeros:0Vmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select/Enter:0�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray:0smodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0�
Kmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Minimum:0Vmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1/Enter:0�
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1:0amodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter:0�
Ylstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:0fmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter:0�
Wlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:0gmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter:0�
Qmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice:0Tmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less/Enter:0�
Omodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLen:0\model/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqual/Enter:0ROmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter:0RQmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_1:0RQmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_2:0RQmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_3:0RQmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_4:0ZQmodel/lstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice:0
�Y
Wmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context *Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond:02Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge:0:Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity:0BPmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit:0BRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_1:0BRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_2:0BRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_3:0BRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_4:0J�O
Ylstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:0
[lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:0
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLen:0
Mmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Minimum:0
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray:0
�model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice:0
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_1:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_2:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_3:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_4:0
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit:0
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_1:0
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_2:0
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_3:0
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_4:0
^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqual/Enter:0
Xmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqual:0
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity:0
Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1:0
Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_2:0
Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_3:0
Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_4:0
Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less/Enter:0
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less:0
Xmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1/Enter:0
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1:0
Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LogicalAnd:0
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond:0
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge:0
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge:1
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1:1
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_2:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_2:1
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_3:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_3:1
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_4:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_4:1
Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration:0
[model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_1:0
[model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_2:0
[model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_3:0
[model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_4:0
Xmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select/Enter:0
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select:0
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_1:0
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_2:0
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch:0
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch:1
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_1:0
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_1:1
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_2:0
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_2:1
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_3:0
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_3:1
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_4:0
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_4:1
cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter:0
emodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1:0
]model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3:0
umodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3:0
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add/y:0
Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1/y:0
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1:0
_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add:0
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1:0
imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter:0
cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd:0
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const:0
cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_1:0
cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2:0
hmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter:0
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul:0
_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul:0
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1:0
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2:0
cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid:0
emodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1:0
emodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2:0
`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh:0
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1:0
gmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axis:0
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concat:0
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:0
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:1
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:2
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:3
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zeros:0�
Ylstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:0imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter:0�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray:0umodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0�
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice:0Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less/Enter:0�
Mmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Minimum:0Xmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1/Enter:0�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zeros:0Xmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select/Enter:0�
[lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:0hmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter:0�
�model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0emodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1:0�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLen:0^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqual/Enter:0�
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1:0cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter:0RQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter:0RSmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_1:0RSmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_2:0RSmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_3:0RSmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_4:0ZSmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice:0
�Y
Wmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context *Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond:02Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge:0:Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity:0BPmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit:0BRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_1:0BRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_2:0BRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_3:0BRmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_4:0J�O
Ylstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:0
[lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:0
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLen:0
Mmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Minimum:0
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray:0
�model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice:0
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_1:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_2:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_3:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_4:0
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit:0
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_1:0
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_2:0
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_3:0
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_4:0
^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqual/Enter:0
Xmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqual:0
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity:0
Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1:0
Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_2:0
Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_3:0
Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_4:0
Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less/Enter:0
Pmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less:0
Xmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1/Enter:0
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1:0
Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LogicalAnd:0
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond:0
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge:0
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge:1
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1:1
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_2:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_2:1
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_3:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_3:1
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_4:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_4:1
Ymodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration:0
[model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_1:0
[model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_2:0
[model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_3:0
[model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_4:0
Xmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select/Enter:0
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select:0
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_1:0
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_2:0
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch:0
Rmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch:1
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_1:0
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_1:1
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_2:0
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_2:1
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_3:0
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_3:1
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_4:0
Tmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_4:1
cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter:0
emodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1:0
]model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3:0
umodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3:0
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add/y:0
Omodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add:0
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1/y:0
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1:0
_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add:0
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1:0
imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter:0
cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd:0
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const:0
cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_1:0
cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2:0
hmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter:0
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul:0
_model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul:0
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1:0
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2:0
cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid:0
emodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1:0
emodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2:0
`model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh:0
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1:0
gmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axis:0
bmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concat:0
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:0
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:1
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:2
amodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:3
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zeros:0�
Ylstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:0imodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter:0�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray:0umodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0�
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice:0Vmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less/Enter:0�
Mmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Minimum:0Xmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1/Enter:0�
Kmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zeros:0Xmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select/Enter:0�
[lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:0hmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter:0�
�model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0emodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1:0�
Qmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLen:0^model/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqual/Enter:0�
Smodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1:0cmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter:0RQmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter:0RSmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_1:0RSmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_2:0RSmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_3:0RSmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_4:0ZSmodel/lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice:0
�W
Umodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/while_context *Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond:02Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge:0:Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity:0BNmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit:0BPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_1:0BPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_2:0BPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_3:0BPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_4:0J�N
Wlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:0
Ylstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:0
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLen:0
Kmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Minimum:0
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray:0
~model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice:0
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_1:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_2:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_3:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_4:0
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit:0
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_1:0
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_2:0
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_3:0
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Exit_4:0
\model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqual/Enter:0
Vmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqual:0
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity:0
Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_1:0
Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_2:0
Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_3:0
Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Identity_4:0
Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less/Enter:0
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less:0
Vmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1/Enter:0
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1:0
Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LogicalAnd:0
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/LoopCond:0
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge:0
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge:1
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_1:1
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_2:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_2:1
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_3:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_3:1
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_4:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Merge_4:1
Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration:0
Ymodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_1:0
Ymodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_2:0
Ymodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_3:0
Ymodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/NextIteration_4:0
Vmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select/Enter:0
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select:0
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_1:0
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select_2:0
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch:0
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch:1
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_1:0
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_1:1
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_2:0
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_2:1
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_3:0
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_3:1
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_4:0
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Switch_4:1
amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter:0
cmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1:0
[model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3:0
smodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3:0
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add/y:0
Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1/y:0
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/add_1:0
]model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add:0
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1:0
gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter:0
amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd:0
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const:0
amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_1:0
amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2:0
fmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter:0
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul:0
]model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul:0
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1:0
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2:0
amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid:0
cmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1:0
cmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2:0
^model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh:0
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1:0
emodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axis:0
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/concat:0
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:0
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:1
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:2
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/split:3
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zeros:0�
Wlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:0gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter:0�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray:0smodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0�
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice:0Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less/Enter:0�
Kmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/Minimum:0Vmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Less_1/Enter:0�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/zeros:0Vmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Select/Enter:0�
Ylstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:0fmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter:0�
~model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0cmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1:0�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/CheckSeqLen:0\model/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/GreaterEqual/Enter:0�
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/TensorArray_1:0amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter:0ROmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter:0RQmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_1:0RQmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_2:0RQmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_3:0RQmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/while/Enter_4:0ZQmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/strided_slice:0
�W
Umodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/while_context *Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond:02Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge:0:Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity:0BNmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit:0BPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_1:0BPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_2:0BPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_3:0BPmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_4:0J�N
Wlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:0
Ylstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:0
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLen:0
Kmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Minimum:0
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray:0
~model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice:0
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_1:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_2:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_3:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_4:0
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit:0
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_1:0
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_2:0
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_3:0
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Exit_4:0
\model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqual/Enter:0
Vmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqual:0
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity:0
Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_1:0
Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_2:0
Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_3:0
Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Identity_4:0
Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less/Enter:0
Nmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less:0
Vmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1/Enter:0
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1:0
Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LogicalAnd:0
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/LoopCond:0
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge:0
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge:1
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_1:1
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_2:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_2:1
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_3:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_3:1
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_4:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Merge_4:1
Wmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration:0
Ymodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_1:0
Ymodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_2:0
Ymodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_3:0
Ymodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/NextIteration_4:0
Vmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select/Enter:0
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select:0
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_1:0
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select_2:0
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch:0
Pmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch:1
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_1:0
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_1:1
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_2:0
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_2:1
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_3:0
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_3:1
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_4:0
Rmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Switch_4:1
amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter:0
cmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1:0
[model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3:0
smodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3:0
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add/y:0
Mmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add:0
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1/y:0
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/add_1:0
]model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add:0
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Add_1:0
gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter:0
amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd:0
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const:0
amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_1:0
amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Const_2:0
fmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter:0
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul:0
]model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul:0
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_1:0
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Mul_2:0
amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid:0
cmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_1:0
cmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Sigmoid_2:0
^model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh:0
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/Tanh_1:0
emodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concat/axis:0
`model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/concat:0
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:0
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:1
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:2
_model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/split:3
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zeros:0�
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray_1:0amodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter:0�
Wlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:0gmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/BiasAdd/Enter:0�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArray:0smodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0�
Qmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice:0Tmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less/Enter:0�
Kmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/Minimum:0Vmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Less_1/Enter:0�
Imodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/zeros:0Vmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Select/Enter:0�
Ylstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:0fmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/basic_lstm_cell/MatMul/Enter:0�
~model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0cmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/TensorArrayReadV3/Enter_1:0�
Omodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/CheckSeqLen:0\model/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/GreaterEqual/Enter:0ROmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter:0RQmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_1:0RQmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_2:0RQmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_3:0RQmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/while/Enter_4:0ZQmodel/lstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/strided_slice:0"�<
	variables�<�<
i
conv1/weights:0conv1/weights/Assignconv1/weights/read:02*conv1/weights/Initializer/random_uniform:0
|
conv1/BatchNorm/beta:0conv1/BatchNorm/beta/Assignconv1/BatchNorm/beta/read:02(conv1/BatchNorm/beta/Initializer/zeros:0
�
conv1/BatchNorm/moving_mean:0"conv1/BatchNorm/moving_mean/Assign"conv1/BatchNorm/moving_mean/read:02/conv1/BatchNorm/moving_mean/Initializer/zeros:0
�
!conv1/BatchNorm/moving_variance:0&conv1/BatchNorm/moving_variance/Assign&conv1/BatchNorm/moving_variance/read:022conv1/BatchNorm/moving_variance/Initializer/ones:0
�
Vlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel:0[lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Assign[lstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:02qlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform:0
�
Tlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias:0Ylstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignYlstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:02flstm2d_1/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros:0
�
Vlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel:0[lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Assign[lstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:02qlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform:0
�
Tlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias:0Ylstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignYlstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:02flstm2d_1/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros:0
�
Tlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel:0Ylstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignYlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:02olstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform:0
�
Rlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias:0Wlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignWlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:02dlstm2d_1/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros:0
�
Tlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel:0Ylstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignYlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:02olstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform:0
�
Rlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias:0Wlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignWlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:02dlstm2d_1/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros:0
�
fully_connected/weights:0fully_connected/weights/Assignfully_connected/weights/read:024fully_connected/weights/Initializer/random_uniform:0
�
 fully_connected/BatchNorm/beta:0%fully_connected/BatchNorm/beta/Assign%fully_connected/BatchNorm/beta/read:022fully_connected/BatchNorm/beta/Initializer/zeros:0
�
'fully_connected/BatchNorm/moving_mean:0,fully_connected/BatchNorm/moving_mean/Assign,fully_connected/BatchNorm/moving_mean/read:029fully_connected/BatchNorm/moving_mean/Initializer/zeros:0
�
+fully_connected/BatchNorm/moving_variance:00fully_connected/BatchNorm/moving_variance/Assign0fully_connected/BatchNorm/moving_variance/read:02<fully_connected/BatchNorm/moving_variance/Initializer/ones:0
�
Vlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel:0[lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Assign[lstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:02qlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform:0
�
Tlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias:0Ylstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignYlstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:02flstm2d_2/horizontal_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros:0
�
Vlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel:0[lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Assign[lstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:02qlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform:0
�
Tlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias:0Ylstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignYlstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:02flstm2d_2/horizontal_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros:0
�
Tlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel:0Ylstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignYlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:02olstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform:0
�
Rlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias:0Wlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignWlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:02dlstm2d_2/vertical_pass/Horizontal_LSTM/lr/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros:0
�
Tlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel:0Ylstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/AssignYlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/read:02olstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/kernel/Initializer/random_uniform:0
�
Rlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias:0Wlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/AssignWlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/read:02dlstm2d_2/vertical_pass/Horizontal_LSTM/rl/Sequence_LSTM/rnn/basic_lstm_cell/bias/Initializer/zeros:0
g
ctc_loss_1/w:0ctc_loss_1/w/Assignctc_loss_1/w/read:02+ctc_loss_1/w/Initializer/truncated_normal:0
g
ctc_loss_1/b:0ctc_loss_1/b/Assignctc_loss_1/b/read:02+ctc_loss_1/b/Initializer/truncated_normal:0
k
ctc_loss_1/w1:0ctc_loss_1/w1/Assignctc_loss_1/w1/read:02,ctc_loss_1/w1/Initializer/truncated_normal:0
k
ctc_loss_1/b1:0ctc_loss_1/b1/Assignctc_loss_1/b1/read:02,ctc_loss_1/b1/Initializer/truncated_normal:0"�

model_variables�
�	
i
conv1/weights:0conv1/weights/Assignconv1/weights/read:02*conv1/weights/Initializer/random_uniform:0
|
conv1/BatchNorm/beta:0conv1/BatchNorm/beta/Assignconv1/BatchNorm/beta/read:02(conv1/BatchNorm/beta/Initializer/zeros:0
�
conv1/BatchNorm/moving_mean:0"conv1/BatchNorm/moving_mean/Assign"conv1/BatchNorm/moving_mean/read:02/conv1/BatchNorm/moving_mean/Initializer/zeros:0
�
!conv1/BatchNorm/moving_variance:0&conv1/BatchNorm/moving_variance/Assign&conv1/BatchNorm/moving_variance/read:022conv1/BatchNorm/moving_variance/Initializer/ones:0
�
fully_connected/weights:0fully_connected/weights/Assignfully_connected/weights/read:024fully_connected/weights/Initializer/random_uniform:0
�
 fully_connected/BatchNorm/beta:0%fully_connected/BatchNorm/beta/Assign%fully_connected/BatchNorm/beta/read:022fully_connected/BatchNorm/beta/Initializer/zeros:0
�
'fully_connected/BatchNorm/moving_mean:0,fully_connected/BatchNorm/moving_mean/Assign,fully_connected/BatchNorm/moving_mean/read:029fully_connected/BatchNorm/moving_mean/Initializer/zeros:0
�
+fully_connected/BatchNorm/moving_variance:00fully_connected/BatchNorm/moving_variance/Assign0fully_connected/BatchNorm/moving_variance/read:02<fully_connected/BatchNorm/moving_variance/Initializer/ones:0*�
serving_default�
1
example_bytes 
Placeholder:0���������2
predictions#
model/Reshape_3:0#Qtensorflow/serving/predict