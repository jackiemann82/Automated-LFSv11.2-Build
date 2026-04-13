#!/bin/bash
LFS="/mnt/lfs"
echo "LFS Build - Step 4 - Create lfs user"
CDIR=`pwd`
groupadd lfs
useradd -s /bin/bash -g lfs -m -p password1 -k /dev/null lfs
chown -R lfs:lfs $LFS/*
chown lfs:lfs $LFS

sudo -u lfs cat > /home/lfs/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

sudo -u lfs cat > /home/lfs/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/usr/bin
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
PATH=$PATH:/usr/sbin:$LFS/tools/bin
CONFIG_SITE=$LFS/usr/share/config.site
export LFS LC_ALL LFS_TGT PATH CONFIG_SITE
EOF
cp -v $CDIR/Scripts/LFS-build-step5.sh /home/lfs

chown -R lfs:lfs /home/lfs/*
chown lfs:lfs /home/lfs
