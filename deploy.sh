#!/bin/bash

APULL=$(which ansible-pull)
MYREPO="https://github.com/bashfulrobot/bashfulrobot-ansible.git"

# Bootstrap Ansible
if [ ! -f "$ANSIBLE" ]; then
    echo "Ansible not found; beginning install..."
    echo

    # Bootstrap Ansible
    sudo apt-get update
    sudo apt-get install git ansible software-properties-common -y
fi

if [ ! -f $HOME/.ansible.cfg ]; then
	touch $HOME/.ansible.cfg
	echo '[defaults]' >$HOME/.ansible.cfg
	echo 'remote_tmp     = /tmp/$USER/ansible' >>$HOME/.ansible.cfg
fi

sudo $APULL -U $MYREPO