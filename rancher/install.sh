#rancher主机安装
docker run -d --restart=unless-stopped -p 18080:8080 --name thanks_rancher rancher/server:stable
#在rancher控制台中添加主机，拷贝节点命令在节点主机中执行，以供rancher管理
