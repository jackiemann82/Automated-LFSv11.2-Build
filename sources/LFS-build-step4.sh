#!/bin/bash
echo "LFS Build - Step 4 - Create lfs user"
LFS="/mnt/lfs"
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
useradd -m -p "$(openssl passwd -1 "password")" "lfs"
chown -R lfs:lfs $LFS/*
chown lfs:lfs $LFS
