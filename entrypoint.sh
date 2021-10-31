#!/bin/sh
set -e
RAM_SIZE=1G
IMAGE_PATH=/vm/worker.img
qemu-system-x86_64 -net nic,model=rtl8139 $PORTMAP -m $RAM_SIZE -smp 2 -enable-kvm -k en-us -vnc :0 -hda $IMAGE_PATH -nographic
