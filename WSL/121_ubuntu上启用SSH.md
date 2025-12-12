# 如何在 Ubuntu 上启用 SSH（适用于 20.04、22.04）？

SSH（Secure Shell）是一种网络协议，用于在不安全的网络中安全地进行远程访问和文件传输。它通过加密技术，确保通信的安全性，使得用户可以在不同的计算机之间安全地传输数据和执行命令。SSH 在 Linux 系统中被广泛使用，特别是在 Ubuntu 这样的开源操作系统中。

SSH 通过使用加密技术来保护通信的安全性。当用户连接到远程服务器时，SSH 会建立一个加密的隧道，所有的数据传输都会在这个隧道中进行加密和解密。这种加密方式可以防止黑客监听或篡改通信内容，确保数据的机密性和完整性。

SSH 还提供了身份验证机制，以确保只有授权用户可以访问远程服务器。用户可以使用密码、密钥对等方式进行身份验证，以证明自己的身份。

# SSH的基本概念
 - **客户端(Client):** 指连接到远程服务器的计算机，通常是用户自己的计算机。
 - **服务器(Server):** 指远程主机，用户希望远程访问的计算机。
 - **会话（Session）:** 指客户端与服务器之间建立的连接，用户可以在会话中执行命令、传输文件等操作。
 - **端口（Port）：** 指网络通信中的一个逻辑连接点，SSH 默认使用 22 端口进行通信。
 - **密钥对（Key Pair）：** 指由公钥和私钥组成的一对密钥，用于加密和解密通信内容以及进行身份验证。

# SSH的版本
SSH 有几个不同的版本，其中最常见的是 SSH-1 和 SSH-2。SSH-1 是较早的版本，存在一些安全漏洞和性能问题，已经逐渐被淘汰。

SSH-2 是当前广泛使用的版本，它修复了 SSH-1 中的一些安全问题，并提供了更强大的加密算法和身份验证机制。

在 Ubuntu 20.04 和 22.04 版本中，默认安装的是 **OpenSSH** 包，它支持 SSH-2 协议，并提供了一套完整的 SSH 客户端和服务器工具。

# 安装SSH服务器
### 步骤 1：更新软件包列表
在安装任何软件之前，最好先更新一下系统的软件包列表，以确保安装的软件是最新的版本。打开终端，执行以下命令：
```bash
sudo apt update && sudo apt upgrade -y
```
### 步骤 2：安装 OpenSSH 服务器
在 Ubuntu 中，OpenSSH 是最常见的 SSH 服务器实现。您可以使用以下命令安装 OpenSSH 服务器：
```bash
sudo apt install openssh-server
```
系统会提示您输入密码以确认安装，输入密码后按下 Enter 键继续。

### 步骤 3：检查 SSH 服务器状态
安装完成后，SSH 服务器会自动启动。可以使用以下命令检查 SSH 服务器的状态：
```bash
sudo systemctl status ssh
```
如果 SSH 服务器正在运行，您将看到类似如下的输出：

```bash
ssh.service - OpenBSD Secure Shell server
     Loaded: loaded (/lib/systemd/system/ssh.service; enabled; vendor preset: enabled)
     Active: active (running) since Sat 2022-04-09 14:30:00 UTC; 1min 30s ago
       Docs: man:sshd(8)
             man:sshd_config(5)
    Process: 12345 ExecStartPre=/usr/sbin/sshd -t (code=exited, status=0/SUCCESS)
   Main PID: 12346 (sshd)
      Tasks: 1 (limit: 4567)
     Memory: 2.2M
        CPU: 50ms
     CGroup: /system.slice/ssh.service
             └─12346 /usr/sbin/sshd -D

Apr 09 14:30:00 ubuntu systemd[1]: Starting OpenBSD Secure Shell server...
Apr 09 14:30:00 ubuntu sshd[12346]: Server listening on 0.0.0.0 port 22.
Apr 09 14:30:00 ubuntu sshd[12346]: Server listening on :: port 22.
Apr 09 14:30:00 ubuntu systemd[1]: Started OpenBSD Secure Shell server.
```

可以看到 Active: active (running)，表示 SSH 服务器正在运行。

### 步骤 4：配置 SSH 服务器（可选）
默认情况下，OpenSSH 服务器的配置文件位于 **/etc/ssh/sshd_config**。  
可以根据需要修改此文件来进行自定义配置。  
例如，可以更改 SSH 服务器的监听端口、允许或禁止密码登录、限制登录用户等。

# 允许 SSH 通过防火墙
在 Ubuntu 中允许 SSH 通过防火墙（通常是 ufw，即 Uncomplicated Firewall）非常重要，以确保远程访问的安全性。

### 步骤 1：检查防火墙状态
首先，需要检查系统上的防火墙是否已启用，并了解其当前配置。在终端中执行以下命令：
```bash
sudo ufw status
```
如果防火墙已经启用，您会看到类似以下的输出：
```bash
Status: active

To                         Action      From
--                         ------      ----
OpenSSH                    ALLOW       Anywhere
```

如果防火墙尚未启用，会看到输出 Status: inactive，表明防火墙当前处于禁用状态。

### 步骤 2：允许 SSH 通过防火墙
如果防火墙已启用但未允许 SSH 通过，则需要执行以下命令来添加 SSH 规则：

```bash
sudo ufw allow OpenSSH
```
这将在防火墙规则中添加一个允许 SSH 服务通过的条目。

### 步骤 3：启用防火墙（如果尚未启用）
如果防火墙尚未启用，需要执行以下命令来启用防火墙：
```bash
sudo ufw enable
```

将收到一个提示，询问是否继续启用防火墙。输入 y 并按下 Enter 键继续。

### 步骤 4：验证防火墙规则
最后，可以再次运行 sudo ufw status 命令来验证 SSH 是否已成功添加到防火墙规则中。
如果一切正常，应该会看到类似以下的输出：
```bash
Status: active

To                         Action      From
--                         ------      ----
OpenSSH                    ALLOW       Anywhere
```
这表示防火墙已成功配置为允许 SSH 服务通过。

# 测试 SSH 连接
要测试 SSH 连接，可以使用 SSH 客户端尝试连接到您的 Ubuntu 服务器。

### 步骤 1：获取服务器 IP 地址
首先，需要获取您的 Ubuntu 服务器的 IP 地址。  
可以在终端中运行以下命令来查看：
```bash
ip addr show | grep inet
```
这将列出所有网络接口的 IP 地址。找到服务器的 IP 地址并记下来。

### 步骤 2：使用 SSH 客户端连接到服务器
在本地计算机上打开终端，并执行以下命令来连接到 Ubuntu 服务器：

```bash
ssh username@server_ip_address
```

在这个命令中，将  
username 替换为在服务器上的用户名，  
server_ip_address 替换为您在步骤 1 中找到的服务器 IP 地址。

例如，如果用户名是 user，服务器的 IP 地址是 192.168.1.100，则命令如下：
```bash
ssh user@192.168.1.100
```

### 步骤 3：输入密码（如果需要）
如果这是您第一次连接到服务器，系统可能会要求您输入密码。输入密码并按下 Enter 键。

如果首次连接到服务器并成功验证身份，系统可能会显示一条消息询问是否愿意继续连接。输入 yes 并按下 Enter 键。

### 步骤 4：验证连接
如果一切正常，应该会看到类似以下的输出，表示已成功连接到服务器：
```bash
Welcome to Ubuntu 20.04.1 LTS (GNU/Linux 5.4.0-42-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

...
```
这意味着已经成功通过 SSH 连接到Ubuntu 服务器。
















