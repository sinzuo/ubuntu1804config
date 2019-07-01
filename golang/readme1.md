由于谷歌被墙，跟谷歌相关的模块无法通过go get来下载，解决方法
git clone https://github.com/golang/net.git $GOPATH/src/github.com/golang/net
git clone https://github.com/golang/sys.git $GOPATH/src/github.com/golang/sys
git clone https://github.com/golang/tools.git $GOPATH/src/github.com/golang/tools
ln -s $GOPATH/src/github.com/golang $GOPATH/src/golang.org/x