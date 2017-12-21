#安装docker
yum install -y epel-release 
yum clean all
yum list
yum install -y docker-io
systemctl start docker
docker info

#docker 远程连接
#set DOCKER_NETWORK_OPTIONS=" -H tcp://0.0.0.0:1314 -H unix:///var/run/docker.sock "
#sed  -i '/DOCKER_NETWORK_OPTIONS/c DOCKER_NETWORK_OPTIONS= -H tcp://0.0.0.0:1314 -H unix:///var/run/docker.sock '  /etc/sysconfig/docker-network 
#echo "更改docker network配置文件，配置远程ip与端口"
#cat /etc/sysconfig/docker-network   
#echo "更新docker service文件"
#systemctl daemon-reload
#echo "重启docker"
#systemctl restart docker
#echo "查看端口信息"
#netstat -ntpl