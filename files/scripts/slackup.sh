#!/bin/bash

declare -r BASEURL="https://downloads.slack-edge.com/linux_releases"

declare -r WGET="$(which wget)"
declare -r MKDIR="$(which mkdir)"
declare -r APT="$(which apt)"
declare -r SUDO="$(which sudo)"
declare -r ECHO="$(which echo)"
declare -r CAT="$(which cat)"
declare -r TOUCH="$(which touch)"

declare -r SLACKUPCFG="$HOME/.config/slackup"
declare -r PREVER="$SLACKUPCFG/prev.ver"
declare -r PSVER="$($CAT $PREVER)"

$MKDIR -p "$SLACKUPCFG"

$TOUCH "$PREVER"

# Parse version from release notes
declare -r SVER=$(curl -s https://slack.com/intl/es/release-notes/linux | sed -n "/^.*<h2>Slack /{;s///;s/[^0-9.].*//p;q;}")

# Compare installed version
# Using text file - less compute

echo $PSVER
echo $SVER

exit 1

if [ "$PSVER" = "$SVER" ]; then
  $ECHO "Slack is already up to date. EXITING"
  exit 0
fi

# Create/Update version file
$ECHO $SVER > $PREVER

DL_FILE="slack-desktop-$SVER-amd64.deb"
FDL_FILE="$BASEURL/$DL_FILE"

$ECHO "Downloading $DL_FILE"

cd $HOME/Downloads
$WGET $FDL_FILE

$SUDO $APT install ./$DL_FILE -y

exit 0
