#!/bin/bash

### SCRIPT VARS
ANSIBLE=$(which ansible-playbook)
APULL=$(which ansible-pull)
GIT=$(which git)
MYLOCBASE="$HOME/tmp"
MYREPO="$MYLOCBASE/bashfulrobot-ansible"
MYREPORMT="https://github.com/bashfulrobot/bashfulrobot-ansible.git"
MYPPA="ansible"
RANUPDATE="NO"

### SCRIPT FUNCTIONS

# Check if software is installed and install with APT if needed.
function checkInstalledApt () {
  if ! command -v $1 &> /dev/null; then
    echo "$1 is not installed."
    echo "Installing."
    # Need better option. Set on script first run.
    if $RANUPDATE == "NO"; then
    sudo apt update && RANUPDATE="YES"
    fi
    sudo apt install -y $1
  fi
}

# Ansible Deploy from local GIT repo
function deployLocal() {
  if [ ! -f "$MYYAML" ]; then
    # Get the repo if needed
    mkdir -p $MYLOCBASE
    cd $MYLOCBASE
    $GIT clone $MYREPORMT
  else
    cd $MYREPO
    # Get the latest version if exists.
    $GIT pull
  fi

  # Run ansible-pull no matter what (local dev iteration)
  sudo $ANSIBLE $MYYAML --connection=local
}

# Update APT Repos


neededSoftware=( software-properties-common ansible dialog git )

# Install Software if needed

for sw in "${neededSoftware[@]}"
  do
    checkInstalledApt "$sw"
  done

# Configure git
$GIT config user.name bashfulrobot
$GIT config user.email dustin@bashfulrobot.com
$GIT config user.editor code

# Setup Ansible CFG
if [ ! -f $HOME/.ansible.cfg ]; then
  touch $HOME/.ansible.cfg
  echo '[defaults]' > $HOME/.ansible.cfg
  echo 'remote_tmp     = /tmp/$USER/ansible' >> $HOME/.ansible.cfg
fi

# Build Menu
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Deploying ansible scripts"
TITLE="Ansible Deploy"
MENU="Choose one of the following options:"

OPTIONS=(1 "Local Repo Deploy All"
         2 "Local Repo Deploy ZSH"
         3 "Remote Repo Deploy All"
         4 "Local Repo Test Script")

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
            deployLocal
            ;;
        2)
            echo "Running $MYREPO/local-test.yml"
            MYYAML="$MYREPO/local-test.yml"
            deployLocal
            ;;
        3)
            echo "Running ansible-pull from $MYREPORMT"
            sudo $APULL -U $MYREPORMT
            ;;
        4)
            echo "Running $MYREPO/local-test.yml"
            MYYAML="$MYREPO/local-test.yml"
            deployLocal
            ;;
esac

exit 0