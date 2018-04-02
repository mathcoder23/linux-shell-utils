echo "创建elk用户"
groupadd elsearch
useradd elsearch -g elsearch -p elasticsearch
cd /home/elsearch
su elsearch 
echo "切换用户至elsearch"
echo "安装jdk环境"

echo "下载elasticsearch"
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.3.tar.gz
echo "解压elasticsearch"
tar -zxvf elasticsearch-6.2.3.tar.gz
cd elasticsearch-6.2.3
bin/elasticsearch-plugin install x-pack
