--------------------------------------------- 
作者：jiang_yi_bo
来源：广州芯卓信息科技有限公司
口号: all in onekey 【一切在一键】
网址：http://www.sinzuo.com/article/
--------------------------------------------- 
版权声明：本文为博主原创文章，转载请附上博文链接！

新增 nfs 挂载功能
2、make menuconfig

Kernel modules  --->

Filesystems  --->

<*> kmod-fs-nfsv3........................... NFS client v3 filesystem support 

3、make V=s
