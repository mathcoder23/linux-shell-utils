echo "/etc/docker/daemon.json"
cat /etc/docker/daemon.json
echo "/etc/docker/daemon.json 将被覆盖你确定吗?"
read confirm
echo "{ \
  "tlsverify": true, \
  "tlscert": "/var/docker/server-cert.pem", \
  "tlskey": "/var/docker/server-key.pem", \
  "tlscacert": "/var/docker/ca.pem", \
  "hosts": [ \
    "tcp://0.0.0.0:2376", \
    "unix:///var/run/docker.sock" \
  ] \
}" > /etc/docker/daemon.json
cat /etc/docker/daemon.json
