#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "syntax:"
	echo "./runqemu.sh path_to_img"
	exit 1
fi

hda="$1"

qemu="qemu-system-arm"
#kernel="-kernel kernel-qemu"
#kernel="-kernel kernel.img"
kernel="-kernel zImage_vers_fs"
cpu="-cpu arm1176"
mem_args="-m 256"
M="-M versatilepb"
serial="-serial stdio"
#hda="-hda ArchLinuxARM-2014.01-rpi.img"
#hda="-hda 2014-01-07-wheezy-raspbian.img"
#hda="-hda rootfs.img"
#redir="-redir tcp:5022::22"
#redir=""
reboot="-no-reboot"
#net="-net nic,model=rtl8139"
net="-net nic -net user,hostfwd=tcp::2222-:22,hostfwd=tcp::22280-:80"
soundhw="-soundhw all"
debug=""
append=""
#graphic="--nographic"
#graphic=""

${qemu} ${kernel} ${cpu} ${mem_args} ${M} ${reboot} ${serial} ${append} ${hda} ${redir} ${net} ${soundhw} ${graphic} -append "root=/dev/sda2 panic=1 console=ttyS0 console=ttyAMA0,115200 console=tty"
