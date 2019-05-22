# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

function asciinema-upload() {
curl -v -u $USER:$(cat ~/.config/asciinema/install-id) https://asciinema.org/api/asciicasts -F asciicast=@$1
}

function do-update() {
  echoHeader "Starting System Update"
  echoSection "Updating Sources"
  sudo apt update
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