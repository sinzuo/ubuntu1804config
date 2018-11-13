git clone https://github.com/sinzuo/golangTest
编译成 testServer9091 放到目录 /usr/sbin/ 下
放到了绝对目录 //mnt/dShare/shareDir9091
访问 http://qq.sinzuo.com:9091/
http://192.168.3.242:9091/


上传页面
http://qq.sinzuo.com:9091/image
http://192.168.3.242:9091/image

可以直接用命令上传 http上传
curl  -F "file=@./fuqiao.tar.gz" http://qq.sinzuo.com:9091/image
curl  -F "file=@./fuqiao.tar.gz" http://192.168.3.242:9091/image
curl  -F file=@fuqiao.tar.gz http://192.168.3.242:9091/image