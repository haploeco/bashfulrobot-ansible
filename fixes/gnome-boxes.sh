##!/bin/bash

sudo apt install qemu-kvm libvirt-bin gnome-boxes -y

sudo echo 'group="kvm"' >> /etc/libvirt/qemu.conf

sudo usermod -a -G kvm $USER

exit 0
