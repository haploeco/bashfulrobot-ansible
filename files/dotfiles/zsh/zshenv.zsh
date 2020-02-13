################################################################################
# File: ZSH Environment (zshenv)       # Created: 2020-01-12                   #
################################################################################
# Author: Nate Thompson                # Last Revision: 2020-01-12             #
################################################################################

# Set path
export PATH=$HOME/.tfenv/bin:$HOME/.tgenv/bin:$PATH:$HOME/bin:/$(du "$HOME/.local/bin" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):/snap/bin:/usr/local/go/bin:$HOME/go/bin

# non-reparenting for java in dwm/i3/etc
export _JAVA_AWS_WM_NONREPARENTING=1

# Define my applications
export EDITOR="nvim"
export TERMINAL="st"
export FILE="vifm"
export READER="zathura"
export BROWSER="firefox"

# Terraform directories
IL01DIR="${HOME}/projects/sciac/infrastructure-live-01"
IM01DIR="${HOME}/projects/sciac/infrastructure-modules-01"

#
export CDPATH=".:~:~/projects/sciac/infrastructure-live-01:~/projects/sciac/infrastructure-modules-01:~/PycharmProjects:~/git/dotfiles"
export PROMPT_COMMAND='history -a;history -n;if [ "$(id -u)" -ne 0 ]; then echo "$(pwd) $(history 1)" >> ~/projects/history/zsh_history-$(date "+%Y-%m-%d").log;fi'
export XDG_CONFIG_HOME="${HOME}/.config"
