sudo mkdir /usr/local/node
cd /usr/local/node
sudo wget  https://npm.taobao.org/mirrors/node/v8.9.3/node-v8.9.3-linux-x86.tar.gz
tar -zxvf node-v8.9.3-linux-x86.tar.gz
ln -s /usr/loca/node/node-v8.9.3-linux-x86/bin/npm /usr/local/bin/ 
ln -s /usr/loca/node/node-v8.9.3-linux-x86/bin/node /usr/local/bin/ 
rm -rf /usr/local/node/node-v8.9.3-linux-x86.tar.gz
