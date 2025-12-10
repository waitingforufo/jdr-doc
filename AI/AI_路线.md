### 1. LLM（自然语言处理）, Transformer 逐层分解，8 大神经网络

- **FNN** 前馈网络
- **CNN** 卷积层网络
- GAN
- **RNN** 循环反馈网络
- ANN
- GNN
- Auto encoder
- **LSTM** Long-Short Txxx Model 长短 xxx
- Transformer

### 2. RAG（私有知识库，给大模型参考）， Agent（19 种框架。 让大模型自主决策，并执行任务）

### 3. LangChain（构建，管理 LLM 的开发框架） / LangGraph

### 4. 预训练，微调（Fine-tuning，3 种方式）

### 5. 实战微调大模型

##### 微调： 考前复习

##### RAG： 考试带小抄

- Retrieval（检索）： from 外部数据库
- Augmentation（增强）： 检索结果一起发送给 AI
- Generation（生成）： 加强后的输入 -> 最终回答

### 微调 -> LLM/Transformer(LangChain/LangGraph) -> 微调实践 -> AI 系统工程师架构师

### 实战：1. 医疗药典，智能监控，诊标系统

### Embedding：对于上传的文件进行解析的。 为本数据 -> Embedding ->向量数据

### R 检索： Chat 模型 / Embedding 模型（文本转换，图形）

### 本地部署流程：

1.下载 Ollama，通过 Ollama 将 DeepSeek 模型下载到本地运行  
2.下载 RAGflow 源代码和 Docker，通过 Docker 来本地部署 RAGflow  
3.在 RAGflow 中构建**个人知识库**，并实现基于个人知识库的对话问答

7b（70 亿） GPU：8G
13b GPU：16G
33b GPU：32G

**语言类**（可能根本不支持视觉）：
Gemma, DeepSeek(底层也是 qwen), qwen2

**视觉类**
llava  
★minicpm-v
