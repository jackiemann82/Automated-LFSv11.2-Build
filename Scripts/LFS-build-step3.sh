#!/bin/bash
echo "LFS build - Step 3 - Create Basic Filesystem"
CDIR=`pwd`

mkdir -pv $LFS/{etc,var,sources} $LFS/usr/{bin,lib,sbin}
cp -rvf $CDIR/sources/ $LFS
cp -v $CDIR/Scripts/LFS-chroot-build-step{1,2}.sh $LFS
chmod -v a+wt $LFS/sources

cd $LFS
for i in bin lib sbin; do
	ln -sv usr/$i $LFS/$i;
done

case $(uname -m) in
	x86_64) mkdir -pv $LFS/lib64 ;;
esac

mkdir -pv $LFS/tools
