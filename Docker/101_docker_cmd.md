# 拉取docker镜像文件
（https://hub.docker.com/_/redmine）

docker pull redmine:trixie

# 运行redmine镜像文件
#docker run -d --name JDR-redmine2 -p 3000:3000 -v ./data:/usr/src/redmine/files redmine:trixie

docker run -d --name JDR-redmine2 -p 3000:3000 -v ./data/sqlite:/usr/src/redmine/sqlite redmine:trixie


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


