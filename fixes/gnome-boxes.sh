##!/bin/bash

sudo apt install qemu-kvm libvirt-bin

Add group=kvm to /etc/libvirt/qemu.conf

sudo usermod -a -G kvm $USER