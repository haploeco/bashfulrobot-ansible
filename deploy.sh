#!/bin/bash

APULL=$(which ansible-pull)
MYREPO="https://github.com/bashfulrobot/bashfulrobot-ansible.git"

sudo $APULL -U $MYREPO