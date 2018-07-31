#!/bin/bash

APULL=$(which ansible-pull)
MYREPO="https://github.com/bashfulrobot/bashfulrobot-ansible.git"
MYPPA="ansible"

# Bootstrap Ansible
if ! grep -q "$MYPPA" /etc/apt/sources.list.d/*; then
    echo "Ansible Repo not available"
    sudo apt-get install software-properties-common
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install ansible -y
fi

sudo $APULL -U $MYREPO