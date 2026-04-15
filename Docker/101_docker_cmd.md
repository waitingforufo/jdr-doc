# 拉取docker镜像文件
（https://hub.docker.com/_/redmine）

docker pull redmine:trixie

# 运行redmine镜像文件
#docker run -d --name JDR-redmine2 -p 3000:3000 -v ./data:/usr/src/redmine/files redmine:trixie

docker run -d --name JDR-redmine2 -p 3000:3000 -v ./data/sqlite:/usr/src/redmine/sqlite redmine:trixie

```shell
# -v ./data/sqlite:/usr/src/           数据卷挂载
#    主机目录      : 容器内目录
```

## Sqlite data folder:
C:\Users\Administrator\data\sqlite


user:  admin  
pwd:  P@ssw0rd


http://localhost:3000


docker ps

# 列出所有容器（包含已停止的）
docker ps -a

# 仅显示容器的ID（用于批量操作（如批量删除，批量停止））
docker ps -q


docker stop JDR-redmine2

docker start JDR-redmine2

docker restart JDR-redmine2

# remove the container
docker rm  JDR-redmine2

# kill the container( also process)
docker kill JDR-redmine2


#
docker exec -it JDR-redmine2 bash

docker logs JDR-redmine2


# 创建镜像
docker build [OPTIONS] PATH

# 查看本地镜像
docker images  

# 删除镜像
docker rmi 镜像名称  

# 镜像重命名
docker tag 原镜像tag    新镜像tag  

# 查看镜像创建历史
docker history 镜像  

# 镜像归档
docker save 镜像  

eg. 将镜像aaa 保存为sinn_v1.tar归档文件  
docker save -o sinn_v1.tar   aaa  

# 基于归档文件创建镜像
docker import sinn_v1.tar   new_sinn:v2  

# 登录远程镜像仓库
docker login -u 用户名 -p 密码  

# 拉取镜像
docker pull 镜像  

# 推送镜像
docker push sinn_v1:v1  

# 搜索镜像
docker search   镜像名  

e.g.  
docker search  redmine  

# 镜像通过 docker run命令来使用
docker run [OPTIONS] IMAGE [COMMAND] [ARG...]  
or  
docker run 容器配置项 镜像 额外的配置  

```shell
e.g.
docker run -name sinn-server -p 8888:8888 -d -e 'NODE_ENV=production' --restart=always sinn:v1

# --name sinn-server      指定容器名为sinn-server
# -p 8888:8888            宿主机端口8888 与 容器内端口8888映射
# -d                      守护进程运行
# -e 'NODE_ENV=production' 设置环境变量NODE_ENV
# --restart=always        开机自启动
# sinn:v1                 指定的镜像名
```

# docker ps / docker ps -a  查看所有正在运行（含结束）的容器  

# 查看容器
docker ps  

# 启动已停止的容器
docker start [options] [containers]  

# 停止容器
docker stop  sinn-server  

# 重启容器
docker restart sinn-server  

# 删除容器
docker rm sinn-server  

注意： 删除容器: docker rm ; 删除镜像命令是 docker rmi  

# 进入容器
docker exec -it 容器名称/ID 终端  

e.g. 进入ID为 0d15561b9f10的容器  
docker exec -it sinn-server bash  
or  
docker exec -it 0d15561b9f10 /bin/bash  

# 查看容器日志
docker logs sinn-server  

# 容器与主机之间的数据拷贝： docker cp
```shell
# 将主机的/data/user目录 -》 容器sinn-server内的 /data/user目录  
docker cp /data/user          sinn-server:/data/user  

# 将容器sinn-server内的 /data/user 目录 -》 主机的 /data/user 
docker cp sinn-server:/data/user        /data/user
```