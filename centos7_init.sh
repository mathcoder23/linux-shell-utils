vi /etc/sysconfig/network-scripts/ifcfg-enp0 //把ONBOOT=no改为ONBOOT=yes
service network restart
yum install net-tools //安装网络工具 比如netstat ifconfig 等命令
yum install netstat //网络查看工具
yum install nc //tcp，udp测试工具