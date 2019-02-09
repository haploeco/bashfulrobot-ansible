#!/bin/bash

ANSIBLE=$(which ansible-playbook)
GIT=$(which git)
MYLOCBASE="$HOME/tmp"
MYREPO="$MYLOCBASE/bashfulrobot-ansible"
MYREPORMT="https://github.com/bashfulrobot/bashfulrobot-ansible.git"
MYPPA="ansible"

$GIT config user.name bashfulrobot
$GIT config user.email dustin@bashfulrobot.com

if [ ! -f /tmp/foo.txt ]; then
    echo "Ansible not found!"

    # Bootstrap Ansible
    sudo apt-get install software-properties-common
    sudo apt-get update
    sudo apt-get install git ansible -y
fi

if [ ! -f $HOME/.ansible.cfg ]; then
    touch $HOME/.ansible.cfg
    echo '[defaults]' > $HOME/.ansible.cfg
    echo 'remote_tmp     = /tmp/$USER/ansible' >> $HOME/.ansible.cfg
fi

# Get the repo

if [ ! -f $MYREPO/local.yml ]; then

mkdir -p $MYLOCBASE
cd $MYLOCBASE
$GIT clone $MYREPORMT
fi

cd $MYREPO

# Get the latest version.
$GIT pull

# Run ansible-pull no matter what (local dev iteration)
sudo $ANSIBLE $MYREPO/local.yml --connection=local

#sudo rm -rf $HOME/.ansible/
