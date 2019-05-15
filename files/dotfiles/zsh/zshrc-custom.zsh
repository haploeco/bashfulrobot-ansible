# This file overrides any settings in the main ~/.zshrc file.
# - may want to split into different files for plugins,
#   aliases, ecports, etc.

# Set Shell Theme
# - Note this is a custom theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Support additional terminal 
export TERM=xterm-256color

# My zsh plugins
plugins=(
  git
  ansible
  aws
  colored-man-pages
  colorize
  common-aliases
  docker
  docker-compose
  github
  rsync
  systemd
  themes
  tmux
  ubuntu
  ufw
  vscode
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# Daily updates - default is every 2 weeks
UPDATE_ZSH_DAYS=1

# Suggest corrections for incorrect commands.
ENABLE_CORRECTION="true"

# https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#option-3-install-awesome-powerline-fonts
#POWERLEVEL9K_MODE='awesome-patched'
