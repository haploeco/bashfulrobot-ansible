#!/bin/bash

# Check if OMF is already installed.
# Bypass install if it is.
# Otherwise Ansible fails out becasue the
# official installer "asks" you if you want to remove it.


# Run installer if the directory does not exist
if [ ! -d "$HOME/.local/share/omf" ]; then
  fish /tmp/install-oh-my-fish.sh --path=$HOME/.local/share/omf --config=$HOME/.config/omf
fi
