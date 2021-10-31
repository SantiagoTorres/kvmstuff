#!/bin/sh
set -e
RAM_SIZE=2G
IMAGE_PATH=/vm/worker.img
IMAGE_SRC="https://gitlab.archlinux.org/archlinux/arch-boxes/-/jobs/38089/artifacts/raw/output/Arch-Linux-x86_64-basic-20211030.38089.qcow2"

if [ ! -f "$IMAGE_PATH" ]
then
    echo "No image found, downloading latest worker image"
    curl "$IMAGE_SRC" -o "$IMAGE_PATH"
fi
qemu-system-x86_64 -net nic,model=rtl8139 $PORTMAP -m $RAM_SIZE -smp 8 -enable-kvm -k en-us -vnc :0 -hda $IMAGE_PATH -nographic
