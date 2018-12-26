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



所见即所得

修改信道设置 auto
diff --git a/package/ramips/applications/uci2dat/src/uci2dat.c b/package/ramips/applications/uci2dat/src/uci2dat.c
index 2e1827f..3c2fc18 100755
--- a/package/ramips/applications/uci2dat/src/uci2dat.c
+++ b/package/ramips/applications/uci2dat/src/uci2dat.c
@@ -887,7 +887,7 @@ void hooker(FILE * fp, param * p, const char * devname)
     }
     else if(0 == strcmp(p->dat_key, "AutoChannelSelect"))
     {
-        if(0 == strcmp(p->value, "0"))
+        if(0 == strcmp(p->value, "auto"))
             FPRINT(fp, p, "2");
         else
             FPRINT(fp, p, "0");

mount -t cifs //192.168.3.242/linuxRoot /mnt/winShare -o username=jiang,password=bobo392816