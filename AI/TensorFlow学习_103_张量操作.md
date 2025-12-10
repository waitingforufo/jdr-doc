# TensorFlow 张量操作

张量是 TensorFlow 中的核心数据结构，可以理解为多维数组的扩展概念。  
在机器学习中，**几乎所有数据最终都会被表示为张量形式**进行处理。

## 张量 的基本特性

1.**数据类型(dtype)：** 每个张量都有特定的数据类型，如 tf.float32, tf.int64 等  
2.**形状(shape)：** 表示张量每个维度的大小，如（2,3）表示 2 行 3 列的数据  
3.**设备位置(device)：** 指示张量存储在 CPU 上还是 GPU 上

## 张量的维度

- 0 维张量： 标量(scalar),如 tf.constant( 5 )
- 1 维张量： 向量(vector), 如 tf.constant( [1,2,3] )
- 2 维张量: 矩阵(matrix), 如 tf.constant( [1,2], [3,4] )
- 3 维及以上： 高阶张量，如 tf.ones( (2,3,4) )表示 2 个 3x4 的矩阵

# 创建张量的常用方法

## 1.从 Python 列表/NumPy 数组创建

```python
# TensorFlow张量操作

# 1.从Python列表/NumPy数组创建
import tensorflow as tf
import numpy as np

# 从Python列表创建
tensor_from_list = tf.constant( [ [1,2],[3,4] ])
print("\n\ntensor_from_list: ", tensor_from_list)

# 从NumPy数组创建
numpy_array = np.array( [[5,6],[7,8]] )
tensor_from_numpy = tf.constant( numpy_array )
print("tensor_from_numpy: ", tensor_from_numpy)

```

## 2.创建特殊值张量

```python
# 2.创建特殊值张量
# 全零张量
zeros = tf.zeros( (2,3))  # 2行3列的全0矩阵

# 全一张量
ones = tf.ones( (3,2))  # 3行2列的全1矩阵

# 单位矩阵
eye = tf.eye(3)         # 3x3的单位矩阵

# 填充特定值
filled = tf.fill( (2,2),7 )  # 2x2矩阵，所有元素为7

```

## 3.创建随机张量

```python
# 均匀分布随机数
uniform = tf.random.uniform((2,2), minval=0, maxval=1)

# 正态分布随机数
normal = tf.random.normal((3,3), mean=0, stddev=1)

# 随机排列
shuffled = tf.random.shuffle( tf.constant([1,2,3,4,5]) )

```

# 张量的基本操作

## 1.数学运算

```python
# 1.数学运算
a = tf.constant([[1,2],[3,4]])
b = tf.constant([[5,6], [7,8]])

# 逐元素加法
add = tf.add( a, b )  # 或 使用运算符重载 a + b

# 逐元素乘法
mul = tf.multiply(a,b)  # 或 a * b

# 矩阵乘法
matmul = tf.matmul( a, b )  # 或 a @ b

# 其他数学运算
sqrt = tf.sqrt( tf.cast(a, tf.float32) )  # 平方根（需要转换为浮点型）

```

## 2.形状操作

```shape
# 实例
tensor = tf.constant( [ [1,2,3],[4,5,6] ] )

# 获取形状
shape = tensor.shape  # 返回（2,3）
print("\n\nshape: ", shape)

# 改变形状(reshape)
reshaped = tf.reshape( tensor, (3,2) )  # 变为3行2列

# 转置(transpose)
transpose = tf.transpose( tensor )  # 变为3行2列

# 扩展维度(expand_dims)
expanded = tf.expand_dims( tensor, axios=0 )  # 形状从（2,3）变为（3,2）

```

## 3.索引与切片

```python
# 实例
tensor = tf.constant(
    [
        [1,2,3],
        [4,5,6],
        [7,8,9]
    ] )

# 获取单个元素
elem = tensor[1, 2]  # 获取第2行第3列的元素（值为6）

# 切片操作
row = tensor[1, :]  # 获取第2行所有元素[4, 5, 6]
col = tensor[:, 1]  # 获取第2列所有元素[2, 5, 8]
sub = tensor[0:2, 1:]  # 获取第1-2行，第2-3列[[2,3],[5,6]]

```

# 张量的广播机制

广播（Broadcasting）是 TensorFlow 中处理不同形状张量运算的重要机制，它自动扩展较小的张量以匹配较大张量的形状。

## 广播规则

1.从最后一个维度开始向前比较  
2.两个维度要么相等，要么其中一个为 1， 要么其中一个不存在  
3.在缺失或为 1 的维度上进行复制扩展

## 广播实例

```python
# 实例

# 向量(3, )与标量（）相加
a = tf.constant([1,2,3])
b = tf.constant(2)
c = a + b  # 结果为[3,4,5], b被广播为[2,2,2]

# 矩阵(3,1)与向量(3,)相加
d = tf.constant([[1],[2],[3]])
e = tf.constant([10, 20, 30])
f = d + e  # d被广播为[[1,1,1],[2,2,2],[3,3,3]]
           # 结果为[[11,21,31],[12,22,32],[13,23,33]]
```

# 张量的聚合操作

```python
# 常用聚合函数
tensor = tf.constant(
    [
        [1,2,3],
        [4,5,6]
    ])

# 求和
sum_all = tf.reduce_sum(tensor)       # 所有元素求和 -> 21
sum_axis0 = tf.reduce_sum(tensor, 0)  # 沿第0维（行）求和 -> [5,7,9]
sum_axis1 = tf.reduce_sum(tensor, 1)  # 沿第1维（列）求和 -> [6, 15]

print("\n\nsum_all: ", sum_all)  # sum_all:  tf.Tensor(21, shape=(), dtype=int32)
print("sum_axis0: ", sum_axis0)  # sum_axis0:  tf.Tensor([5 7 9], shape=(3,), dtype=int32)
print("sum_axis1: ", sum_axis1)  # sum_axis1:  tf.Tensor([ 6 15], shape=(2,), dtype=int32)

# 求均值
mean_all = tf.reduce_mean(tensor)    # 所有元素均值 -> 3.5

# 最大值/最小值
max_val = tf.reduce_max(tensor)      # 最大值 -> 6
min_val = tf.reduce_min(tensor)      # 最小值 -> 1

print("\nmax_val: ", max_val)  # max_val:  tf.Tensor(6, shape=(), dtype=int32)
print("min_val: ", min_val)    # min_val:  tf.Tensor(1, shape=(), dtype=int32)

# 逻辑运算
any_true = tf.reduce_any(tensor > 4)
all_true = tf.reduce_all(tensor > 0)

print("\nany_true: ", any_true)  # any_true:  tf.Tensor(True, shape=(), dtype=bool)
print("all_true: ", all_true)    # all_true:  tf.Tensor(True, shape=(), dtype=bool)
```
