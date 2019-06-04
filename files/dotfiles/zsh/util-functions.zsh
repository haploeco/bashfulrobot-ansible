# These utilities are used in multiple
# zsh functions on my system

# Vars
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
NC=$(tput sgr0)

ONLINE="${GREEN}online$NC"
OFFLINE="${RED}offline$NC"


function echoHeader () {
  echo
  echo
  printf "%40s \n" "[$RED $1 $NC]"
  # echo "> > >  $1 =========="
  echo
}

function echoSection () {
  echo
  echo
  printf "$GREEN > > > $NC %1s \n" "$YELLOW $1 $NC"
  # echo "> > >  $1 =========="
  echo
}

function checkInstalledApt () {
  if $(command -v $1 &> /dev/null); then
        echo "$1 is not installed."
        echo "Installing."
        sudo apt install -y $1
fi
}

function checkInstalledSnap () {
  if $(command -v $1 &> /dev/null); then
        echo "$1 is not installed."
        echo "Installing."
        sudo snap install $1
fi
}