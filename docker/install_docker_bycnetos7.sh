#安装docker
prefix="#################"
echo "${prefix}脚本更新于2018-03-01"
config=`cat << EOF
{
    "registry-mirrors": ["https://sbp3d98l.mirror.aliyuncs.com"]
}
EOF
`


function docker_install(){
    echo "${prefix}开始安装docker"
    yum install -y epel-release 
    yum clean all
    yum list
    yum install -y docker-io
    systemctl start docker
    echo "${prefix}docker安装完成,如果出现r下面docke信息，说明安装成功"
    docker info
}
function docker_compose_install(){
    echo "${prefix}docker-compose安装"
    yum -y install epel-release
    yum -y install python-pip
    pip install docker-compose
    echo "${prefix}docker-compose安装完成,如果出现下面compose信息，说明安装成功"
    docker-compose version
}
function docker_config(){
    echo "${prefix}配置docker阿里云加速,这将覆盖/etc/docker/daemon.json，原始将会备份/etc/docker/daemon.json.bak"
    sudo mkdir -p /etc/docker
    cp /etc/docker/daemon.json /etc/docker/daemon.json.bak
    sudo echo ${config} >> /etc/docker/daemon.json
    sudo systemctl daemon-reload
    sudo systemctl restart docker
    echo ""${prefix}开机启动docker"
    systemctl enable docker

}
docker_install
docker_config
docker_compose_install
