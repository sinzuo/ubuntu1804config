脚本使用


mount -t nfs //192.168.1.176/volume1/nfsFiles /mnt/nfs

mount -t cifs //192.168.0.176/homes /mnt/winShare -o username=jiang,password=bobo392816
mount -t cifs //192.168.1.176/homes /mnt/winShare -o username=jiang,password=bobo392816

Makedown 每行添加空格
sed -i 's/$/ ABC/' file1

追加 ABC到每行末尾

$为末尾符号，s代表替换末尾为 ABC

wc -l //总行数
head 1 //第一行



