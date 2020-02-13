# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

function asciinema-upload() {
  curl -v -u $USER:$(cat ~/.config/asciinema/install-id) https://asciinema.org/api/asciicasts -F asciicast=@$1
}

function myint() {
  ip -4 a | grep -v valid_lft | awk '{print $2}'
}

function myip() {
  hostname -I | awk '{print $1}'
}

function myip() {
  curl -s https://myip.biturl.top/ | cut -d "%" -f1
}

function do-update() {
  runAptUpdateIfNeeded
  sleep 1
  echoSection "Updating Distro"
  sudo apt dist-upgrade -y
  sleep 1
  echoSection "Performing Autoremove"
  sudo apt clean -y
  sudo apt autoremove -y
  sleep 1
  echoSection "Adding Missing Deps"
  sudo apt install -f -y
  sleep 1
  echoHeader "Completed System Update"
}

function hap-clone() {
  # Is GIT installed?
  checkInstalledApt git
  # Check if the repo exists already
  # GIT PULL if it does
  if [ -d "$HOME/tmp/$1" ]; then
    echo "Directory $HOME/tmp/$1 exists. Pulling remote repo instead."
    echo
    cd "$HOME/tmp/$1"
    git pull
    echo
  else
    # Repo does not exist, clone
    git clone git@github.com:haploeco/$1 "$HOME/tmp/$1"
  fi

  echo
  echo "Current repo files ----"
  ls "$HOME/tmp/$1"
  echo
}

function update-system-cfg() {
  APULL=$(which ansible-pull)
  MYREPORMT="https://github.com/haploeco/bashfulrobot-ansible.git"
  $APULL -U $MYREPORMT
}

function rename-pad-num() {
  rename 's/\d+/sprintf("%04d",$&)/e' "$1"
}
