#!/bin/bash

read -r -p "Confirm that the versions on your system match the script --> [ENTER]"

ls -al /usr/lib/x86_64-linux-gnu/libgstreamer-1.0.so.0.*
ls -al /usr/lib/x86_64-linux-gnu/libgstapp-1.*
ls -al /usr/lib/x86_64-linux-gnu/libgstbase-1.0.so.0.*
read -r -p "Look at the ...1401... --> [ENTER]"

cat ./fix-vmware-18.04.sh

read -r -p "Do they match? [Ctrl -C] to fix; [ENTER] to continue..."

sudo ln -s /usr/lib/x86_64-linux-gnu/libgstreamer-1.0.so.0.1401.0 /usr/lib/x86_64-linux-gnu/libgstreamer-0.10.so.0

sudo ln -s /usr/lib/x86_64-linux-gnu/libgstapp-1.0.so.0 /usr/lib/x86_64-linux-gnu/libgstapp-0.10.so.0

sudo ln -s /usr/lib/x86_64-linux-gnu/libgstbase-1.0.so.0.1401.0 /usr/lib/x86_64-linux-gnu/libgstbase-0.10.so.0

exit 0
