mount -t nfs 192.168.3.242:/nfs /mnt/nfsShare

挂载ntfs 时只读的问题解决
   ntfsfix /dev/sda7 
   mount -t ntfs -w /dev/sda7 /mnt/linuxShare/
   mount 
   umount /mnt/linuxShare 
   mount -t ntfs -w /dev/sda7 /mnt/linuxShare/