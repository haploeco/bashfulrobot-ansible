#!/bin/bash

ANSIBLE=$(which ansible-playbook)
GIT=$(which git)
MYLOCBASE="$HOME/tmp"
MYREPO="$MYLOCBASE/bashfulrobot-ansible"
MYREPORMT="https://github.com/bashfulrobot/bashfulrobot-ansible.git"
MYPPA="ansible"

$GIT config user.name bashfulrobot
$GIT config user.email dustin@bashfulrobot.com
$GIT config user.editor micro

if [ ! -f "$ANSIBLE" ]; then
    echo "Ansible not found; beginning install..."
    echo

    # Bootstrap Ansible
    sudo apt-get install software-properties-common
    sudo apt-get update
    sudo apt-get install git dialog ansible -y
fi

if [ ! -f $HOME/.ansible.cfg ]; then
    touch $HOME/.ansible.cfg
    echo '[defaults]' > $HOME/.ansible.cfg
    echo 'remote_tmp     = /tmp/$USER/ansible' >> $HOME/.ansible.cfg
fi

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Deploying ansible scripts locally"
TITLE="Local Deploy"
MENU="Choose one of the following options:"

OPTIONS=(1 "Deploy All"
         2 "Deploy ZSH"
         3 "Run test script")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear

case $CHOICE in
        1)
            echo "Running $MYREPO/local.yml"
            MYYAML="$MYREPO/local.yml"
            ;;
        2)
            echo "Running $MYREPO/local-test.yml"
            MYYAML="$MYREPO/local-test.yml"
            ;;
        3)
            echo "Running $MYREPO/local-test.yml"
            MYYAML="$MYREPO/local-test.yml"
            ;;
esac

# Get the repo

if [ ! -f "$MYYAML" ]; then

mkdir -p $MYLOCBASE
cd $MYLOCBASE
$GIT clone $MYREPORMT
fi

cd $MYREPO

# Get the latest version.
$GIT pull

# Run ansible-pull no matter what (local dev iteration)
sudo $ANSIBLE $MYYAML --connection=local

#sudo rm -rf $HOME/.ansible/