sudo mkdir /usr/local/node
cd /usr/local/node
sudo wget  https://npm.taobao.org/mirrors/node/v8.9.3/node-v8.9.3-linux-x86.tar.gz
tar -zxvf node-v8.9.3-linux-x86.tar.gz
mv /usr/local/bin/node /usr/local/bin/node.bak
mv /usr/local/bin/npm /usr/local/bin/npm.bak

ln -s /usr/local/node/node-v8.9.3-linux-x86/bin/node /usr/bin
ln -s /usr/local/node/node-v8.9.3-linux-x86/bin/npm /usr/bin
rm -rf /usr/local/node/node-v8.9.3-linux-x86.tar.gz
