# 模型示例

> Transformer 下载模型的时候，是从 Hugging Face 上下载的吗？
> 是的，**Hugging Face 是一个开源机器学习和自然语言处理库**，它**提供了一个模型仓库（Model Hub）**，包含了**许多预训练好的模型**，包括
> **transformer 等神经网络模型**。这些模型可以直接从 Hugging Face Model Hub 中下载并使用，避免了自己去训练这些复杂的模型。

你可以**通过 Hugging Face 的 Transformers 库**来访问这些模型，并将它们集成到你的应用中。

# 现在是时候使用 HuggingFaceTransformers 库探索一个模型示例的架构了。

# install: pip3 install transformers

让我们快速看一下 HuggingFaceTransformers 如何让我们查看 transformer 及其 tokenizer 的代码以及处理过程是如何发生的

所以处理和信息流是如何从 tokenizer 到 transformer 解码堆栈到元素，并查看代码中是如何工作的

所以我们先从几个后勤工作开始

```python
# Warning control
import warnings
warnings.filterwarnings('ignore')
```

我们只想去掉一下我们将要看到的这些警告。

然后我们将加载一个语言模型

```python
from transformers import AutoModelForCausalLM, AutoTokenizer, pipeline

# Load model and tokenizer（from PHY3迷你模型）
tokenizer = AutoTokenizer.fom_pretrained("microsoft/Phi-3-mini-4k-instruct")

# 加载语言模型（PHY3迷你模型。本地不存在就先下载）
model = AutoModelForCausalLM.from_pretrained(
    "microsoft/Phi-3-mini-4k-instruct",  # PHY3迷你模型
    device_map="cpu",
    torch_dtype="auto",
    trust_remote_code=True,
)
```

###### -----------------------------------------------

输出信息：
Special tokens have been added in the vocabulary, make sure the associated word embeddings are fine-tuned or trained.
`flash-attention` package not found,consider installing for better performance: No module named 'flash_attn'.
Current `flash-attention` does not support `window_size`. Either upgrade or use `attn_implementation='eager'`.
Loading checkpoint shards: 100% |■■■■■| 2/2 [00:00<00:00, 6.48it/s]

###### ----------------------------------------------

它向我们显示了一些警告，但我们可以忽略它们。

现在让我们定义一个 HuggingFace pipeline（万能工具）。

```python
# Create a pipeline
generator = pipeline(
    "text-generation",
    model=model,          # 下载的PHY3迷你模型生成的模型
    tokenizer=tokenizer,  # 下载的PHY3迷你模型生成的 tokenizer
    return_full_text=False,
    max_new_tokens=50,    # 每当我们给你一个提示，希望你生成50个token作为响应
    do_sample=False,      # 我们正在进行贪婪解码
)
```

这只是一个代码抽象， 使得在我们给它并加载模型后更容易在 LLM 中生成代码并进行 tokenize。

do_sample=False,意味着我们正在进行贪婪解码，所以对于每个 token 它会评分输出 token 的概率，并选择概率最高的 token，所以这几乎就像将温度设置为零一样。

现在我们已经完成了。
我们可以声明我们的提示并将其传递给模型

```python
prompt = "Write an email apologizing to Sarah for the tragic gardening mishap. Explain how it happened."

output = generator(prompt)  # 模型调用

print(output[0]['generated_text'])
```

我们可以声明我们的提示并将其传递给模型，写一封电子邮件，为悲惨的园艺事故向 Sarah 道歉，解释一下这是怎么发生的。

让我们调到生成完成的时候，谈谈它在这个过程中做了什么

```text
# 输出结果
Email to Sarah:
Subject: Sincere Apologies for the Gardening Mishap

Dear Sarah,
I hope this message finds you well. I am writing to express my deepest ap
```

# ↑ 然后它在生成的第 50 个或最后一个标记中间停止了

现在你可以借此机会将提示更改为你想要的任何内容，看看模型如何响应

在这个例子中，**生成输出可能需要大约两分钟**，因为**它在 CPU 上运行**。
这就是为什么在工业界很多这些模型**实际上运行在高度优化的 GPU 上**。
我们讨论的许多效率方法对于加快生成速度非常重要，这就是为什么有很多关注点在于效率。

现在很多人除了聊天界面或游乐场之外，并没有使用过语言模型。

这是**用代码生成语言模型的第一步**，可以对这些模型有更好的了解。

请继续，我会向你展示 HuggingFace 的一些很酷的功能，帮助你理解模型的层次结构及其工作原理。

需要指出的几点是，**现在我们已经将模型加载为 model**，我们可以直接打印它，这将显示模型的结构。

```python
print(model)
```

**输出结果**

```python
Phi3ForCausalLM(
    (model):Phi3Model(
        (embed_tokens): Embedding(32064, 3072, padding_idx=32000)  # 标记矩阵 模型词汇表中有32064个标记，模型维度是3072
        (embed_dropout): Dropout(p=0.0, inplace=False)             # 标记矩阵
        (layers): ModuleList(  # 变压器块的位置
            (0-31): 32 x Phi3DecoderLayer(  # 有32个解码器变压器层（下面看到每个层的确切组件）
                (self_attn): Phi3Attention(  # 投影
                    (o_proj): Linear(in_features=3072, out_features=3072, bias=False)
                    (qkv_proj): Linear(in_features=3072, out_features=9216, bias=False)
                    (rotary_emb): Phi3RotaryEmbedding()  # 旋转嵌入的添加
                )
                (mlp): Phi3MLP(  # MLP（Multi-Layer-Perceptron）多层感知器，即前馈神经网络
                    (gate_up_proj): Linear(in_features=3072, out_features=16384,bias=False)  # 将其投影到高纬度，这里是16384未
                    (down_proj): Linear(in_features=8192, out_features=3072, bias=False) # 然后再投影到3072的模型维度
                    (activation_fn): SiLU() # 激活函数
                )
                (input_layernorm): Phi3RMSNorm()  # 层规范化
                (resid_attn_dropout): Dropout(p=0.0, inplace=False)
                (resid_mlp_dropout): Dropout(p=0.0, inplace=False)
                (post_attention_layernorm): Phi3RMSNorm()
            )
        )
        (norm): Phi3RMSNorm()
    )
    (lm_head): Linear(in_features=3072, out_features=32064, bias=False)  # 模型的末端会看到语言建模头，它接收最终的3072维向量，这是模型维度，它为模型词汇表中的每个标记输出一个分数
)
```

缩进的模型架构，显示了层次结构。
这是用于因果语言建模的 5.3， 这是一个解码器模型。
这是一个因果语言模型或自回归模型，这意味着注意力步骤只关注前面的标记。

Hugging Face 也使得做这样的事情成为可能，所以可以像如下浏览：

```python
model.model
```

**输出结果：**

```python
Phi3Model(
        (embed_tokens): Embedding(32064, 3072, padding_idx=32000)  # 标记矩阵 模型词汇表中有32064个标记，模型维度是3072
        (embed_dropout): Dropout(p=0.0, inplace=False)             # 标记矩阵
        (layers): ModuleList(  # 变压器块的位置
            (0-31): 32 x Phi3DecoderLayer(  # 有32个解码器变压器层（下面看到每个层的确切组件）
                (self_attn): Phi3Attention(  # 投影
                    (o_proj): Linear(in_features=3072, out_features=3072, bias=False)
                    (qkv_proj): Linear(in_features=3072, out_features=9216, bias=False)
                    (rotary_emb): Phi3RotaryEmbedding()  # 旋转嵌入的添加
                )
                (mlp): Phi3MLP(  # MLP（Multi-Layer-Perceptron）多层感知器，即前馈神经网络
                    (gate_up_proj): Linear(in_features=3072, out_features=16384,bias=False)  # 将其投影到高纬度，这里是16384未
                    (down_proj): Linear(in_features=8192, out_features=3072, bias=False) # 然后再投影到3072的模型维度
                    (activation_fn): SiLU() # 激活函数
                )
                (input_layernorm): Phi3RMSNorm()  # 层规范化
                (resid_attn_dropout): Dropout(p=0.0, inplace=False)
                (resid_mlp_dropout): Dropout(p=0.0, inplace=False)
                (post_attention_layernorm): Phi3RMSNorm()
            )
        )
        (norm): Phi3RMSNorm()
    )
```

↑ 如上，现在我们进入了模型本身，可以像这样处理所有这些层，可以像如下访问嵌入层矩阵：

```python
model.model.embed_tokens

# 输出结果：
(embed_tokens): Embedding(32064, 3072, padding_idx=32000)
```

这样可以访问每个层和矩阵并查看输入大小和输出的方法。

# 不做流水线，用其他方式查看一些信息或处理机制是如何运行的

```python
# 提示词
prompt = "The capital of France is"  # 法国的首都是

# Tokenize the input prompt 把提示词发送给分词器(tokenizer)
input_ids = tokenizer(prompt, return_tensors="pt").input_ids
print(iput_ids)
# 输出结果：
# tensor([[ 450, 7483, 310, 3444, 338 ]])  # 分词的结果
# prompt提示词现在被分成5个标记， 编号450， 编号7483。。。
# 这就是提示词信息的表示方式

# 现在可以将其发送给模型
# 是发送给模型的组件，所以还不会通过语言建模，这只是通过变压器块堆栈流动
model_output = model.model(input_ids)
print(model_output[0].shape)
# 输出结果：
# torch.Size([1, 5, 3072])  # 维度为 1 x 5 x 3072 的张量，这是批次维度，
# 我们只要向模型传递一个文本的结果如上。 训练中会有更多文本，所以这个也可以更多。
# 3072 是输出向量的维度
```

![](/img/2025-11-22_173437.png)
输出向量是上图中红色部分， 3000 是这个红色部分的维度数量。

这是我们进行语言建模之前的向量，我们可以将其独立传递给语言建模头，然后看看输出是什么样子。

```python
lm_head_output = model.lm_head(model_output[0])
print(lm_head_output)
# 输出结果：
# torch.Size([1, 5, 32064])  # 1 x 5 x 32064 的张量
# 32064就是我们的词汇量大小， 是每个词的分数

# 要获得这个提示字符串的实际输出，我们需要发送给模型
token_id = lm_header_output[0, -1].argmax(-1)
print(token_id)
# 输出结果：
# tensor(3681)  # 模型生成的第一个输出标记是标记号3681

print(tokenizer.decode(token_id))
# 输出结果：
# 'Paris'    # 巴黎
```

有趣的是，现在我们有了这个软件，你可以下载到你的电脑或手机上，它能够以某种方式告诉你关于世界的信息。
这可能非常复杂，但还有另一件你只能在这里看到的事情，
那就是**模型实际上从未见过文本**， **模型只看到这些数字列表**，它只输出这些数字数字列表。

**模型接触到的的一切只是标记号， 4 或 4000 等。它从未见过我们所认为的实际字母**。
令人着迷的是，**语言模型以这种方式运行**，**模型实际上从未真正见过人类语言**，
**它只看到这个标记索引列表**。

以上就是对语言代码的快速浏览。

# 最近的改进（2025-11-18）

现在我们知道了变压器语言模型的工作原理，让我们看看最新模型中的一些最新想法
2017 年原始模型的架构：
![](/img/2025-11-23_095336.png)

->
![](/img/2025-11-23_100025.png)
![](/img/2025-11-23_100148.png)
我们重点在于解码器块，解释了这些绝大多数 LLM 如何实际构建和运行的。
现在仍然有一些编码器-解码器模型存在，但**绝大多数文本生成 LLM 是解码器模型**，编码器模型也在像 BERT 或类似 BERT 的模型中使用，这些模型进行文本嵌入或重新排序，或者很多这些高效的 NLP 任务方式，这些任务不一定是文本生成。

因此如果我们仅比较原始变压器的变压器块，我们可以将其与现代时代进行对比，这些事 2024 时代的变压器块，
![](/img/2025-11-23_100807.png)
看起来非常接近，让我们指出一些已经改变的事情：

其中之一是它们不再在这里的开始步骤中进行位置编码，
可以看到我们只用旋转嵌入（黄色部分），位置信息现在加了注意力机制，
层归一化已经移动到自注意力和前馈神经网络层之前，这些实验结果表明，这种设置下的模型表现更好，这些模型也有分组查询注意作为自注意力 - 自注意力机制的演变。

还有一个重要的事情需要注意的是，无论是在原始变压器还是当前的变压器，都是残差连接，这些残差连接绕过 normalize,self-attention 层，将这些信息重新打包回表示中，并将它们重新组合在一起。
![](/img/2025-11-23_104514.png)
![](/img/2025-11-23_104706.png)
![](/img/2025-11-23_104806.png)
![](/img/2025-11-23_104950.png)
![](/img/2025-11-23_105057.png)
![](/img/2025-11-23_105153.png)
![](/img/2025-11-23_105327.png)
