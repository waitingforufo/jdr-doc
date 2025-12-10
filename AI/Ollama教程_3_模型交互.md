# Ollama 模型交互

Ollama 提供了多种方式与模型进行交互，其中最常见的就是通过**命令行**进行推理操作。

## 1.命令行交互

通过命令行直接与模型进行交互是最简单的方式。

### 运行模型

使用 **ollama run** 命令启动模型并进入交互模式：

```shell
ollama run <model-name>

# 下载deepseek-coder模型
ollama run deepseek-coder  # 本地里不存在就先下载再运行

```

### 退出交互模式

输入 /**bye** 或按下 **Ctrl+d** 退出。

## 2.单次命令交互

如果只需要模型生成一次响应，可以直接在命令行中传递输入。

### 使用管道输入

通过管道将输入传递给模型：

```shell
echo "你是谁？" | ollama run deepseek-coder
```

### 使用命令行参数

直接在命令行中传递输入：

```shell
ollama run deepseek-coder "Python 的 hello world 代码？"
```

## 3.多轮对话

Ollama 支持多轮对话，模型可以记住上下文。

## 4.文件输入

可以将文件内容作为输入传递给模型。
假设 input.txt 文件内容为：

```shell
Python 的 hello world 代码？
```

将 input.txt 文件内容作为输入：

```shell
ollama run deepseek-coder < input.txt
```

## 5.自定义提示词

通过 **Modelfile** 定义自定义提示词或系统指令，使模型在交互中遵循特定规则。

### 创建自定义模型

编写一个 Modelfile：

```shell
# 实例
FROM deepseek-coder
SYSTEM "你是一个编程助手，专门帮助用户编写代码。"
```

然后创建自定义模型：

```shell
ollama create runoob-coder -f ./Modelfile
```

运行自定义模型：

```shell
ollama run runoob-coder
```

## 6.交互日志

Ollama 会记录交互日志，方便调试和分析。
查看日志：

```shell
ollama logs
```
