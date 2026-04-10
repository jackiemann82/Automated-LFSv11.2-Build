#!/bin/bash
echo "LFS build - Step 3 - Create Basic Filesystem"
CDIR=`pwd`
cd $LFS
mkdir -pv $LFS/{etc,var,sources,tools} $LFS/usr/{bin,lib,sbin} $LFS/lib/x86_64-linux-gnu
cp -rvf $CDIR/sources/ $LFS
cp -v $CDIR/Scripts/LFS-chroot-build-step{1,2}.sh $LFS
chmod -v a+wt $LFS/sources

for i in bin lib sbin; do
	ln -sv usr/$i $LFS/$i
done

case $(uname -m) in
	x86_64) mkdir -pv $LFS/lib64 ;;
esac
