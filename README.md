# linux-shell-utils
>linux shell script   
封装比较常用的liunx脚本，拿来即用
## 使用方法
>在查看shell文件时，点击本项目右上角Raw按钮，获取一个获取原生文件的url  
使用命令执行:  
curl -o remote.sh ${url} ;bash remote.sh;rm -rf remote.sh #这样就能够直接执行git上的命令了，使用curl的好处是如果url是带授权的，可以很方便的将授权信息带上从而进行认证
## 例子
### 生成docker证书
>curl -o remote.sh https://raw.githubusercontent.com/mathcoder23/linux-shell-utils/master/docker-ca-build.sh;bash remote.sh;rm -rf remote.sh
