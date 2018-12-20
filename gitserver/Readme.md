git 账号 密码 sinzuo@abc

服务器创建  服务器目录 /gitServer

ln -s /mnt/dShare/gitserverDir/ gitServer

假设你已经有sudo权限的用户账号，下面，正式开始安装。

第一步，安装git：

$ sudo apt-get install git

第二步，创建一个git用户，用来运行git服务：

$ sudo adduser git

第三步，创建证书登录：

收集所有需要登录的用户的公钥，就是他们自己的id_rsa.pub文件，把所有公钥导入到/home/git/.ssh/authorized_keys文件里，一行一个。

第四步，初始化Git仓库：

先选定一个目录作为Git仓库，假定是/srv/sample.git，在/srv目录下输入命令：

$ sudo git init --bare sample.git

Git就会创建一个裸仓库，裸仓库没有工作区，因为服务器上的Git仓库纯粹是为了共享，所以不让用户直接登录到服务器上去改工作区，并且服务器上的Git仓库通常都以.git结尾。然后，把owner改为git：

$ sudo chown -R git:git sample.git

第五步，禁用shell登录：

出于安全考虑，第二步创建的git用户不允许登录shell，这可以通过编辑/etc/passwd文件完成。找到类似下面的一行：

git:x:1001:1001:,,,:/home/git:/bin/bash

改为：

git:x:1001:1001:,,,:/home/git:/usr/bin/git-shell

这样，git用户可以正常通过ssh使用git，但无法登录shell，因为我们为git用户指定的git-shell每次一登录就自动退出。

第六步，克隆远程仓库：

现在，可以通过git clone命令克隆远程仓库了，在各自的电脑上运行：

$ git clone git@server:/srv/sample.git
Cloning into 'sample'...
warning: You appear to have cloned an empty repository.

剩下的推送就简单了。
管理公钥

如果团队很小，把每个人的公钥收集起来放到服务器的/home/git/.ssh/authorized_keys文件里就是可行的。如果团队有几百号人，就没法这么玩了，这时，可以用Gitosis来管理公钥。

这里我们不介绍怎么玩Gitosis了，几百号人的团队基本都在500强了，相信找个高水平的Linux管理员问题不大。
管理权限

有很多不但视源代码如生命，而且视员工为窃贼的公司，会在版本控制系统里设置一套完善的权限控制，每个人是否有读写权限会精确到每个分支甚至每个目录下。因为Git是为Linux源代码托管而开发的，所以Git也继承了开源社区的精神，不支持权限控制。不过，因为Git支持钩子（hook），所以，可以在服务器端编写一系列脚本来控制提交等操作，达到权限控制的目的。Gitolite就是这个工具。

这里我们也不介绍Gitolite了，不要把有限的生命浪费到权限斗争中。


git clone ssh://git@qq.sinzuo.com:12345/gitServer/tools/sample.git


git clone git@192.168.3.242:/gitServer/tools/sample.git

添加 远程库
git remote add origin git@192.168.3.242:/gitServer/tools/sample.git

git push --mirror git@192.168.3.242:/gitServer/tools/sample.git

git init --bare ubuntu1804config.git
git push --mirror git@192.168.3.242:/gitServer/ubuntu1804config
git push --mirror git@192.168.3.242:/gitServer/openwrtglibx86
git push --mirror git@192.168.3.242:/gitServer/openwrtlede

git init --bare openwrt_ac.git
git push --mirror git@192.168.3.242:/gitServer/openwrt_ac.git

1、建立新仓库
1). 从原地址克隆一份裸版本库，比如原本托管于 GitHub，或者是本地的私有仓库
git clone --bare git://192.168.10.XX/git_repo/project_name.git
2). 然后到新的 Git 服务器上创建一个新项目，比如 GitCafe，亦或是本地的私有仓库，如192.168.20.XX
su - git
cd /path/to/path/
mkdir new_project_name.git
git init --bare new_project_name.git
3). 以镜像推送的方式上传代码到 GitCafe 服务器上。
请确保已经添加了公钥到新的机器上
cd project_name.git
git push --mirror git@192.168.20.XX/path/to/path/new_project_name.git
4). 删除本地代码
cd ..
rm -rf project_name.git
5). 到新服务器上找到 Clone 地址，直接Clone到本地就可以了。
git clone git@192.168.20.XX/path/to/path/new_project_name.git
这种方式可以保留原版本库中的所有内容。

2、切换remote_url
先查看remote的名字

git branch -r
假设你的remote是origin，用git remote set_url 更换地址

git remote set-url origin remote_git_address
remote_git_address更换成你的新的仓库地址。

第二种切换remote_url的方法更直接，直接更改.git/conf配置文件里的ip地址就行。


# 删除 untracked files
git clean -f
 
# 连 untracked 的目录也一起删掉
git clean -fd
 
# 连 gitignore 的untrack 文件/目录也一起删掉 （慎用，一般这个是用来删掉编译出来的 .o之类的文件用的）
git clean -xfd
 
# 在用上述 git clean 前，墙裂建议加上 -n 参数来先看看会删掉哪些文件，防止重要文件被误删
git clean -nxfd
git clean -nf
git clean -nfd

项目说明
openwrt_ac.git 
openwrtglibx86    openwrt网站上下载最新版本openwrt 自己编译x86固件
openwrtlede.git   网友提供全功能lede固件


推送本地分支local_branch到远程分支 remote_branch并建立关联关系

      a.远程已有remote_branch分支并且已经关联本地分支local_branch且本地已经切换到local_branch

          git push

     b.远程已有remote_branch分支但未关联本地分支local_branch且本地已经切换到local_branch

         git push -u origin/remote_branch

     c.远程没有有remote_branch分支并，本地已经切换到local_branch

        git push origin local_branch:remote_branch


git commit -m "Change repo." # 先把所有为保存的修改打包为一个commit
git remote remove origin # 删掉原来git源
git remote add origin [YOUR NEW .GIT URL] # 将新源地址写入本地版本库配置文件
git push -u origin master # 提交所有代码