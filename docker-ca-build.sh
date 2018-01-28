#echo "指定生成文件的目录，默认是当前目录下的docker-tls"
dir=./docker-tls
echo "指定域名"
HOST=api.zhongxin688.com
read HOST
rm -rf $dir
mkdir $dir
echo "生成ca私钥 $dir/ca-key.pem"
openssl genrsa -aes256 -out $dir/ca-key.pem 4096
echo "生成ca公钥 $dir/ca.pem"
openssl req -new -x509 -days 365 -key $dir/ca-key.pem -sha256 -out $dir/ca.pem
echo "生成服务器私钥 $dir/server-key.pem"
openssl genrsa -out $dir/server-key.pem 4096
echo "生成证书请求文件 $dir/seerver.csr"
openssl req -subj "/CN=$HOST" -sha256 -new -key $dir/server-key.pem -out $dir/server.csr
echo subjectAltName = IP:172.17.0.1,IP:127.0.0.1,IP:172.31.21.206,IP:47.104.85.81 > $dir/extfile.cnf
echo "通过ca签署证书"
openssl x509 -req -days 365 -sha256 -in $dir/server.csr -CA $dir/ca.pem -CAkey $dir/ca-key.pem \
  -CAcreateserial -out $dir/server-cert.pem
echo "客户端证书 $dir/key.pem"
openssl genrsa -out $dir/key.pem 4096
echo "客户端请求文件 $dir/client.csr"
openssl req -subj '/CN=client' -new -key $dir/key.pem -out $dir/client.csr
echo "签署客户端文件"
openssl x509 -req -days 365 -sha256 -in $dir/client.csr -CA $dir/ca.pem -CAkey $dir/ca-key.pem \
  -CAcreateserial -out $dir/cert.pem 
