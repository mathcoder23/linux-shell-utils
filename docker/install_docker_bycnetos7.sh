#安装docker
prefix="#################"
config=`cat << EOF
{
    "registry-mirrors": ["https://sbp3d98l.mirror.aliyuncs.com"]
}
EOF
`


function docker_compose_install(){
    echo "${prefix}docker-compose安装"
    yum -y install epel-release
    yum -y install python-pip
    pip install docker-compose
    echo "${prefix}docker-compose安装完成,如果出现下面compose信息，说明安装成功"
    docker-compose version
}
function docker_install(){
    yum install -y epel-release 
    yum clean all
    yum list
    yum install -y docker-io
    systemctl start docker
    echo "${prefix}docker安装完成,如果出现r下面docke信息，说明安装成功"
    docker info
}
function docker_aliyun_speed(){
    echo "${prefix}配置docker阿里云加速"
    sudo mkdir -p /etc/docker
    sudo echo ${config} >> /etc/docker/daemon.json

    sudo systemctl daemon-reload
    sudo systemctl restart docker
}
function docker_api(){
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
}
docker_compose_install
