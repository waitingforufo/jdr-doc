# Keras - TensorFlow 高级 API

Keras 是一个用 Python 编写的高级神经网络 API，它能够以 TensorFlow，CNTK 或 Theano 作为后端运行。
设计理念： 用户友好，模块化和易扩展。

## Keras 的主要特点

1.**简单易用：** 提供直观一致的接口，适合快速原型设计  
2.**模块化：** 神经网络层，损失函数，优化器等都是可插拔的模块  
3.**易扩展：** 可以轻松添加新模块来表达新的研究想法  
4.**支持多后端：** 可以无缝运行在 TensorFlow，CNTK 或 Theano 上

# Keras 核心概念

## 1.模型（Model）

Keras 的核心数据结构是模型，模型是组织神经网络层的方式。Keras 提供了两种主要的模型：

-**Sequential 模型：** 层的线性堆叠 -**Functianal API：** 构建复杂模型的有向无环图

## 2.层（Layer）

层是 Keras 的基本构建块，每个层接受输入数据，进行某种计算后输出结果。Keras 提供了多种预定一层：

- **核心层：** Dense，Activation，Dropout 等
- **卷积层：** Conv2D，MaxPooling2D 等
- **循环层：** LSTM，GRU 等
- **其他：** Embedding,BatchNormalization 等

## 3.激活函数（Activation Function）

激活函数决定神经元的输出，常用的有：

- **ReLU（Rectified Linear Unit）**
- **Sigmoid**
- **Tanh**
- **Softmax（多分类问题）**

# Keras 基本工作流程
