# Ollama Open WebUI

开源地址：https://github.com/open-webui/open-webui
官方文档：https://docs.openwebui.com/

用户友好的 AI 界面（支持 Ollama，OpenAI API 等）。
支持多种语言模型运行器（如 Ollama 和 OpenAI 兼容 API），并内置了用于检索增强生成（RAG）的推理引擎，使其成为强大的 AI 部署解决方案。

可以自定义 OpenAI API URL，连接 LMStudio，GroqCloud，Mistral，OpenRouter 等。

Open WebUI 管理员可创建详细的用户角色和权限，确保安全的用户环境，同事提供定制化的用户体验。

支持桌面，笔记本电脑和移动设备，并提供移动设备上的渐进式 Web 应用（PWA），支持离线访问。

# 安装

Open WebUI 提供多种安装方式，包括通过 Python pip 安装、Docker 安装、Docker Compose、Kustomize 和 Helm 等。

# 使用 Docker 快速开始

如果 Ollama 已安装在你的电脑上，使用以下命令：

```shell
docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
```

使用 Nvidia GPU 支持运行 Open WebUI：

```shell
docker run -d -p 3000:8080 --gpus all --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:cuda
```

# Open WebUI 与 Ollama 捆绑安装

此安装方法使用一个单一的容器镜像，将 Open WebUI 与 Ollama 捆绑在一起，可以通过一个命令轻松设置。

根据你的硬件配置选择合适的命令。

启用 GPU 支持：

```shell
docker run -d -p 3000:8080 --gpus=all -v ollama:/root/.ollama -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:ollama
```

仅使用 CPU：

```shell
docker run -d -p 3000:8080 -v ollama:/root/.ollama -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:ollama
```

这两个命令都能帮助你简化安装过程，让 Open WebUI 和 Ollama 无缝运行。

安装完成后，你可以通过访问 http://localhost:3000 使用 Open WebUI。
