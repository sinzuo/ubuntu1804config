 fdisk -l
Disk /dev/sda: 14.9 GiB, 16013942784 bytes, 31277232 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xfb55f929


dd if=/dev/sda of=16g-image count=31277232 bs=512

分区表位置
dd if=/dev/sda of=file1 count=1 bs=512

不要分区表后面分区
dd if=/dev/sda bs=512 count=31277231 skip=1 of=file2

cat file2 file1 > file.bak