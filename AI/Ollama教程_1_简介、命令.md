# Ollama 简介

Ollama 是一个开源的本地大语言模型运行框架，专为在本地机器上便捷部署和运行大语言模型（LLM）而设计。

Ollama 提供了一个简单的方式来加载和使用各种预训练的语言模型，支持**文本生成，翻译，代码编写，问答**等多种自然语言处理任务。

不仅是**提供了现成的模型和工具集**，还**提供了方便的界面和 API**，使得从**文本生成**，**对话系统**到**语义分析**等任务都能快速实现。

与其他 NLP 框架不同，Ollama 旨在简化用户的工作流程，使得机器学习不再是只有深度学习技术背景的开发者才能触及的领域。

Ollama 支持多种 OS，包括 macOS，Windows，Linux 以及通过 Docker 容器运行。

Ollama 提供对模型量化的支持，可以显著降低显存要求，使得在普通家用计算机上运行大模型成为可能。

Ollama 支持多种硬件加速选项，包括纯 CPU 推理和各类底层计算架构（如 Apple Silicon），能够更好地利用不同类型的硬件资源。

使用 Ollama，可以在本地运行 Liama3.3, DeepSeek-R1, Phi-4, Mistral, Gemma3 和其他模型。

# 核心功能与特点

## 1.多种预训练语言模型支持

Ollama 提供了多种开箱即用的预训练模型，包括常见的 GPT，BERT 等大型语言模型。用户可以轻松加载并使用这些模型进行文本生成，情感分析，问答等任务。

## 2.易于集成和使用

Ollama 提供了命令行工具（CLI）和 Python SDK，简化了其他项目和服务的集成。  
开发者无需担心复杂的依赖和配置，可以快速将 Ollama 集成到现有的应用中。

## 3.本地部署与离线使用

不同于一些基于云的 NLP 服务，Ollama 允许开发者在本地计算环境中运行模型。这意味着可以脱离对外部服务器的依赖，保证数据隐私，并且对于高并发的请求，离线部署能提供更低的延迟和更高的可控性。

## 4.支持模型微调与自定义

用户不仅可以使用 Ollama 提供的预训练模型，还可以在此基础上**进行模型微调**。根据自己的**特定需求**，开发者可以**使用自己收集的数据**对模型进行**再训练**，从而优化模型的性能和准确度。

## 5.性能优化

Ollama 关注性能，提供了**高效的推理机制**，支持**批量处理**，能够**有效管理内存和计算资源**。这让它在处理大规模数据时依然保持高效。

## 6.跨平台支持

Ollama 支持在多个操作系统上运行，包括 Winows，macOS 和 Linux。这样无论是开发者在**本地环境调试**，还是企业在**生产环境部署**，都能得到**一致的体验**。

## 7.开放源码与社区支持

Ollama 是一个开源项目，这意味着开发者可以查看源代码，进行修改和优化，也可以参与项目的贡献中。此外，Ollma 有一个活跃的社区，开发者可以从中获取帮助并与其他人交流经验。

# 应用场景

## 1.内容创作

帮助作家，记者，营销人员快速**生成高质量的内容**，例如**博客文章，广告文案**等。

## 2.编程辅助

帮助开发者**生成代码，调试程序或优化代码结构**。

## 3.教育和研究

辅助学生和研究人员进行学习，写作和研究，例如**生成论文摘要或解答问题**。

## 4.跨语言交流

提供高质量的**翻译功能**，帮助用户打破语言障碍。

## 5.个人助手

作为一个智能助手，帮助用户完成日常任务，例如**撰写邮件，生成待办事项**等。

# Ollama 与其他 LLM 的区别

| 区别维度 | Ollma 的特点   | 说明                                                             |
| -------- | -------------- | ---------------------------------------------------------------- |
| 本地化   | 更注重本地运行 | 与 ChatGPT 等依赖云服务的 LLM 不同，适合对数据隐私要求较高的用户 |
| 灵活性   | 可加载不同模型 | 可以根据需要加载不同的模型，而无需局限于单一的模型               |
| 开源     | 开源项目       | 用户可以自由地修改和扩展其功能                                   |

# Ollama 安装

https://ollama.com/download。

Ollama 对硬件要求不高，旨在让用户能够轻松地在本地运行，管理与大型语言模型进行交互。

- **CPU：** 多核处理器（推荐 4 核或以上）
- **GPU：** 如果计划运行大型模型或进行微调，推荐使用较高计算能力的 GPU（如 NVIDIA 的 CUDA 支持）。
- **内存：** 至少 8GB RAM，运行较大模型时推荐 16GB 或更高。
- **存储：** 需要足够的硬盘空间来存储预训练模型，通常需要 10GB 至数百 GB 的空间，具体取决于模型的大小。
- **软件要求：** 确保系统上安装了最新版本的 Python（如果打算使用 Python SDK）。

# 验证安装

```shell
ollama --version
```

# 更改安装路径（可选）

安装到非默认路径，可以在安装时通过命令行指定路径：

```shell
OllamaSetup.exe /DIR="d:\some\location"
```

# 安装(Linux)

```shell
curl -fsSL https://ollama.com/install.sh | bash

ollama --version
```

# Docker 安装

如果你熟悉 Docker，也可以通过 Docker 安装 Ollama。

官方 Docker 镜像 ollama/ollama 可在 Docker Hub 上获取：https://hub.docker.com/r/ollama/ollama。

```shell
# 拉取Docker镜像
docker pull ollama/ollama

# 运行容器
docker run -p 11434:11434 ollama/ollama

# 访问 http://localhost:11434 即可使用 Ollama。
```

# Ollama 运行模型

```shell
ollama run 模型名称

# lg. 下载并运行gemma3大模型
ollama run gemma3

# 结束对话
/bye 或 ctrl+d

# 查看已经安装的模型：
ollama list

# jdr@JDR-0001:~$ ollama list
# NAME              ID              SIZE      MODIFIED
# deepseek-r1:8b    6995872bfe4c    5.2 GB    6 hours ago
# qwen3:4b          359d7dd4bcda    2.5 GB    6 hours ago
# gemma3:latest     a2af6cc3eb7f    3.3 GB    7 hours ago
# jdr@JDR-0001:~$
# Ollama 支持的模型可以访问：https://ollama.com/library
```

# 通过 Python SDK 使用模型

如果希望将 Ollama 与 Python 代码集成，可以使用 Ollama 的 Python SDK 来加载运行模型。

## 1.安装 Python SDK

```shell
pip3 install ollama
```

## 2.编写 Python 脚本

接下来，可以使用 Python 代码来加载和与模型交互。

```python
# lg. 使用LLama3.s模型来生成文本
# 实例

import ollama
response = ollama.generate(
    model="llama3.2",  # 模型名称
    prompt="你是谁？"  # 提示文本
)
print( response )
```

## 3.运行 Python 脚本

在终端中运行你的 Python 脚本：

```python
python3 test.py
```

## 4.对话模式

此代码会与模型进行对话，并打印模型的回复：

```python
# 实例
from ollama import chat

stream = chat(
    model="llama3.2",
    messages=[{"role":"user", "content":"为什么天空是蓝色的？"}],
    stream=True
)

for chunk in stream:
    print( chunk["messages"]["content"], end="", flush=True )
```

# 5.流式响应

代码会以流式方式接收模型的相应，适用于处理大数据。

```python
# 实例
from ollama import chat
stream = chat(
    model="llama3.2",
    messages=[ {"role":"user", "content":"为什么天空是蓝的？"}]
)

for chunk in stream:
    print(chunk["message"]["content"], end="", flush=True} )
```

# Ollama 相关命令

## ollama --help

```shell
# 帮助

Large language model runner

Usage:
  ollama [flags]
  ollama [command]

Available Commands:
  serve       Start ollama
  create      Create a model from a Modelfile
  show        Show information for a model
  run         Run a model
  stop        Stop a running model
  pull        Pull a model from a registry
  push        Push a model to a registry
  list        List models
  ps          List running models
  cp          Copy a model
  rm          Remove a model
  help        Help about any command

Flags:
  -h, --help      help for ollama
  -v, --version   Show version information

```

## 1.模型管理

### 拉取模型

从模型库中下载模型；

```shell
ollama pull <model-name>

# lg.
ollama pull llama2
```

### 运行模型

运行已下载的模型：

```shell
ollama run <model-name>  # 没有指定模型的时候，先下载再运行
```

### 列出本地模型

查看已下载的模型列表：

```shell
ollama list
```

### 删除模型

删除本地模型：

```shell
ollama rm <model-name>
```

## 2.自定义模型

### 创建自定义模型

基于现有模型创建自定义模型

```shell
ollama create <custom-model-name> -f <Modelfile>

# 从Modelfile创建模型
ollama create model -of ./Modelfile

# 例如
ollama create my-llama2 -f ./Modelfile
```

### 复制模型

复制一个已存在的模型

```shell
ollama cp <source-model-name> <new-model-name>

# 例如
ollama cp llama2 my-llama2-copy
```

### 推送自定义模型

将自定义模型推送到模型库：

```shell
ollama push <model-name>
```

## 3.服务管理

### 启动 Ollama 服务

启动 Ollama 服务以在后台运行：

```shell
ollama serve
```

### 停止 Ollama 服务

```shell
ollama stop
```

### 重启 Ollama 服务

```shell
ollama restart
```

## 4.其他常用命令

```shell
# 查看帮助
ollama --help

# 查看版本信息
ollama version

# 更新Ollama
ollama update

# 查看日志
ollama logs

# 清理缓存
ollama clean
```

## 5.模型信息

```shell
# 查看模型详细信息
ollama show <model-name>

# 查看模型依赖
ollama deps <model-name>

# 查看模型配置
ollama config <model-name>
```

## 6.导入导出

```shell
# 导出模型
ollama export <model-name> <output-file>

# 导入模型
ollama import <input-file>
```

## 7.系统信息

```shell
# 查看系统信息
ollama system

# 查看资源使用情况
ollama resources <model-name>
```

## 8. 模型性能

```shell
# 查看模型性能
ollama perf <model-name>
```

## 9.模型历史

```shell
# 查看模型历史记录
ollama history <model-name>
```

## 10.模型状态

```shell
# 检查模型状态
ollama status <model-name>
```
