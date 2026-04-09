#!/bin/bash
LFS=/mnt/lfs
echo "LFS - Step 6 - Prep virtual kernel filesystems"
chown -R root:root $LFS/*
chown root:root $LFS
mkdir -pv $LFS/{dev,proc,sys,run}
mount -v --bind /dev $LFS/dev
mount -v --bind /dev/pts $LFS/dev/pts
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run
if [ -h $LFS/dev/shm ]; then
	mkdir -pv $LFS/$(readlink $LFS/dev/shm)
fi
rm -v $LFS/lib64/ld-linux-x86-64.so.2
cp -v /lib/x86_64-linux-gnu/libtinfo.so.6 $LFS/lib/x86_64-linux-gnu/
cp -v /lib/x86_64-linux-gnu/libc.so.6 $LFS/lib/x86_64-linux-gnu/
cp -v /lib64/ld-linux-x86-64.so.2 $LFS/lib64/

mkdir -v $LFS/usr/lib/x86_64-linux-gnu
cp -v /usr/lib/x86_64-linux-gnu/libm.so.6 $LFS/usr/lib/x86_64-linux-gnu/
cp -v /usr/lib/x86_64-linux-gnu/libcrypto.so.3 $LFS/usr/lib/x86_64-linux-gnu/
