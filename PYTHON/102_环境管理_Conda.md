# Conda是什么
是一个**跨平台**的**包管理和环境管理**工具。  
最初为Python设计，但支持任意语言包（如 R，C/C++，Java）。  

## 核心目标
1. **解决依赖冲突**： 自动处理库之间的版本兼容性问题。
2. **创建格力环境：** 为不同项目提供独立的环境，避免全局安装的混乱。  
3. **预编译二进制包：** 无需手动编译，节省时间并降低安装失败率。  

# 什么时候使用Conda？
## 1.管理多个Python版本
  如果你需要在同一台机器上运行不同版本的Python（例如 Python3.10 和 3.13)，
  Conda可以轻松创建格力环境，避免版本冲突。

## 2.跨平台支持
  Conda支持Windows，macOS和Linux，无需担心不同系统下Python环境配置的差异。

## 3.解决依赖冲突
  当项目依赖的库（如 NumPy，Pandas，TensorFlow）版本不兼容时，Conda能自动处理依赖关系，找到兼容的版本组合。

## 4.安装非Python依赖
  Conda不仅可以安装Python包，还能管理其他语言和工具（如R，C/C++库，命令行工具），避免手动安装的麻烦。

## 5.预编译的二进制包
  Conda仓库中的包是预编译的（尤其是科学计算库），安装速度快，无需本地编译，避免因缺少编译器或头文件导致的安装失败。

## 6.科学计算和数据分析生态
  Conda默认集成大量科学计算库（如Anaconda发行版），适合需要快速搭建数据科学环境的场景。

# Conda的核心概念
## （1）包（Package）
Conda包是预编译的二进制文件（如Python库，命令行工具，动态链接库）。  
包含元数据（名称，版本，依赖项，安装脚本等）  

## （2）环境（Environment）
一个隔离的目录，包含特定版本的Python及其依赖的包。  
不同环境互不干扰。  
例如 项目A用 Python3.8+TensorFlow2.4， 项目B用 Python3.10+TensorFlow2.12）

## （3）仓库（Channel）
包的下载来源，默认是 defaults（有Anaconda维护）。  
常用的第三方仓库：  
  - conda-forge：社区维护，包更新更快。
  - pytorch：    PyTorch官方仓库
  - bioconda：   生物信息学工具

## （4） 发行版
Anaconda： 包含 Python 和 150+ 科学计算包（适合开箱即用）。  
Miniconda： 仅包含 Python 和 Conda（轻量级，按需安装）。  

# 4.Conda的核心功能
## （1）环境管理　　　※※※※※※※※※※

### 列出所有环境：
```shell
conda env list
```

### 创建环境：
```shell
conda create --name myenv python=3.9 numpy pandas

# 运行Python
conda activate myenv
python --version
```

### 激活/退出环境：
```shell
conda activate myenv     # 进入环境
conda deactivate         # 推出环境
```

### 删除环境：
```shell
conda env remove --name myenv
```

## （2）包管理

### 搜搜包：
```shell
conda search "numpy>=1.20"

conda search "python"          // 搜索所有可用Python版本
```

### 安装包：
```shell
conda install numpy                      # 从默认仓库安装
conda install -c conda-forge tensorflow  # 指定仓库

```

### 卸载包：
```shell
conda remove numpy
```

### 更新包：
```shell
conda update numpy  # 更新单个包
conda update --all  # 更新所有包
```

## （3）依赖管理

### 导出环境配置：
```shell
conda env export > environment.yml      # 包含精确版本（适合胜寒环境）
conda list --export > requirements.txt  # 仅包名称（适合写作）
```

### 从文件创建环境：
```shell
conda env create -f environment.yml
```

# 5.Conda安装Python
## 1.安装Conda
 - 下载MiniConda（轻量版）或Anaconda（完整科学计算套件）
 - Miniconda: https://docs.conda.io/en/latest/miniconda.html
 - Anaconda: https://www.anaconda.com/download