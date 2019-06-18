##!/bin/bash

sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients gnome-boxes -y

sudo echo 'group="kvm"' >>/etc/libvirt/qemu.conf

sudo usermod -a -G kvm $USER

exit 0
