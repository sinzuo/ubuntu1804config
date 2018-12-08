搭建方法
1.安装pptp以提供VPN服务

输入Ctrl+Alt+T打开一个终端，在里面输入

sudo apt-get install pptpd

    1

很快就安装好了。
2.对pptpd.conf中的配置信息进行修改

在终端中输入命令，使用vim打开pptpd.conf：

sudo vim /etc/pptpd.conf 

    1

如果不会使用vim，并且ubuntu主机上装有图形用户界面，可以使用gedit进行编辑：

sudo gedit /etc/pptpd.conf 

    1

如果主机上没有安装gedit，可以通过下面的命令进行安装：

sudo apt-get install gedit

    1

在打开的内容里面找到这两行，并取消掉注释（PS1：取消注释就是删除行首的#，下同）(PS2：直接找不好找的话，可以使用文本编辑器的查找功能)：

localip  192.168.0.1
remoteip 192.168.0.234-238,192.168.0.245

    1
    2

分别为创建vpn时的主机ip和连接vpn的其他主机使用的ip段，可以自行修改。

注意，这里的ip并不是指外网ip或者当前局域网ip，而是指创建VPN（虚拟专用网络）会分配的ip地址。一般这个可以不用修改。
3.修改chap-secrets以分配vpn账号

连接pptp vpn是需要使用账号登陆的，这个账号由我们自己配置。

首先，打开/etc/ppp/chap-secrets

sudo vim /etc/ppp/chap-secrets 

    1

或

sudo gedit /etc/ppp/chap-secrets 

    1

打开之后，我们在文档末尾添加新的账号，格式如下：

用户名 pptpd 密码 *

    1

如：

zhangsan  pptpd  123456  *

    1

末尾的*表示可以使用任意IP连入，如果你要设置指定IP才能连接到vpn，可以将*替换成对应的IP。

如果要添加多个账号，只需要换行，然后按照格式继续输入即可。
4.设置vpn的ms-dns

接下来，我们要配置vpn使用的dns，这里，我就碰到了一个大坑，后面说。

首先，我们打开/etc/ppp/pptpd-options

sudo vim /etc/ppp/pptpd-options 
或
sudo gedit /etc/ppp/pptpd-options 

    1
    2
    3

在打开的文档中找到ms-dns，并取消掉注释，并在后面填上适当的dns。

一般来说，内网借助vpn访问外网，只需要在这里填上外网的dns就可以了，比如谷歌的dns8.8.8.8和8.8.4.4（情况（3）这样配置ms-dns就可以了，可以直接到下一步了）：

ms-dns 8.8.8.8
ms-dns 8.8.4.4

    1
    2

我遇到的坑点就在这里，我填上谷歌的dns是无法访问外网的。崩溃啊，卡了我好久。各种查找资料，以及对学校的校园网的架构进行分析后，发现原因可能如下：

实验室的那台主机并不是直接访问外网，它仍是校园网的各级子网的一部分，它的网络请求是要查找校园网这个局域网内的dns，经过校园网路由发出去的。

于是，我就去找了校园网的dns主机地址，并填入到ms-dns后面，测试一下，问题解决了= =

跟我相同情况的同学，可以去找一下自己学校的dns服务器的地址，并进行更改。
5.开启内核IP转发

在终端里输入：

sudo vim /etc/sysctl.conf
或
sudo gedit /etc/sysctl.conf
(后面就不就gedit的例子了，大家应该都知道是怎么回事了，不会用vim就用gedit替代就行了)

    1
    2
    3
    4

在打开的文档中找到

#net.ipv4.ip_forward=1

    1

取消掉注释（即删除行首的#）。
保存之后，在终端中输入命令使我们的修改生效：

sudo sysctl -p

    1

6.配置iptables

首先，如果没有安装iptables，要先进行安装，安装过的可以跳过：

sudo apt-get install iptables

    1

接下来，清除iptables里旧的规则（这里针对之前装过pptp，但是没配置好的同学。如果是从我这个教程开始的，并且新装的iptables，这一步可以跳过）。

sudo iptables -F
sudo iptables -X
sudo iptables -t nat -F
sudo iptables -t nat -X

    1
    2
    3
    4

然后，允许gre协议以及1723端口、47端口：

sudo iptables -A INPUT -p gre -j ACCEPT 
sudo iptables -A INPUT -p tcp --dport 1723 -j ACCEPT 
sudo iptables -A INPUT -p tcp --dport 47 -j ACCEPT 

    1
    2
    3

下一步，开启NAT转发：

sudo iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eno1 -j MASQUERADE

    1

注意，上面的eno1是我连接网络的网卡的名称，不同机器这个可能是不一样的。如果不清楚是哪一块网卡联网以及网卡的名称，可以在终端输入ifconfig来查看。
7.重启服务，使我们的配置生效

在终端中输入以下指令重启服务：

sudo service pptpd restart

    1

这个时候，其他机器使用我们之前配置的账号密码，已经可以连接上VPN，并通过VPN来访问外网了。
8.vpn代理上网慢解决方案

在步骤7完成后，vpn已经可以使用了，但是却可能碰到通过vpn上网网速奇慢的情况，我搭建完就是这样的。碰到这种情况，解决方案如下：

打开终端，输入以下命令

sudo -I FORWARD -p tcp --syn -i ppp+ -j TCPMSS --set-mss 1356

    1

重启vpn服务：

sudo service pptpd restart



 pppd call connect vpn


pptpsetup --create myvpn --server qq.sinzuo.com --username jiang --password 123&abc --encrypt --start

sudo pon myvpn

sudo poff myvpn

添加路由
vim /etc/ppp/ip-up

sudo route add -net 192.168.100.0/24 gw 192.168.100.1
