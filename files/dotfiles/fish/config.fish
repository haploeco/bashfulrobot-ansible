### Main fish config

### OMF

# omf install budspencer
#set -U fish_key_bindings fish_vi_key_bindings
#set -U budspencer_nogreeting

# omf install bobthefish
# set -g theme_display_git no
# set -g theme_display_git_untracked no
# set -g theme_display_git_ahead_verbose yes
# set -g theme_git_worktree_support yes
# set -g theme_display_vagrant yes
# set -g theme_display_docker_machine no
# set -g theme_display_hg yes
# set -g theme_display_virtualenv no
# set -g theme_display_ruby no
# set -g theme_display_user yes
# set -g theme_display_vi no
# set -g theme_display_date no
# set -g theme_display_cmd_duration yes
# set -g theme_title_display_process yes
# set -g theme_title_display_path no
# set -g theme_title_use_abbreviated_path no
# set -g theme_date_format "+%a %H:%M"
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
# set -g default_user your_normal_user
# Themes listed here:
# https://github.com/oh-my-fish/theme-bobthefish
set -g theme_color_scheme zenburn
# set -g fish_prompt_pwd_dir_length 0
# set -g theme_project_dir_length 1

# Set vi keybindings to be closer to bash
fish_vi_key_bindings

# enable emoji in shell
# why? why not.
set -U -x fish_emoji_width 2

### GO

# Is snapteh GO installed?
if test -e /snap/bin/go
    # Set GO{PATH,BIN}
    set -x GOPATH $HOME/go
    set -x GOBIN $GOPATH/bin
    set -x GOROOT /snap/go/current
    # I know fish has a mech to set the path elsewhere.
    # This makes it portable when I setup new systems.

    # Create GOPATH structure if it does not exist
    if test ! -d $GOPATH/bin
        mkdir -p $GOPATH/{src/github.com/bashfulrobot,pkg,bin}
    end

    # When using the SNAP, no need to add `/snap/bin`
    ## as it already exists in the PATH.end
    #set PATH /snap/bin $GOBIN $PATH
    set PATH $GOBIN $PATH
end
# RUST

## Disabled currently.
if test -e $HOME/.cargo/bin/rustup
    set PATH $HOME/.cargo/bin $PATH
else
    # Skip[ rust config
    #$echo "Rust is not installed."
end

# SNAPCRAFT

## Set Snapcraft to use multipass for cleanbuild (could also use `lxd`)
#set -e SNAPCRAFT_BUILD_ENVIRONMENT
#set -x SNAPCRAFT_BUILD_ENVIRONMENT lxd
set -x SNAPCRAFT_BUILD_ENVIRONMENT multipass
