#!/bin/bash

set -e

zrc="$HOME/.zshrc"
theme="junkfood"
sedcmd="s/ZSH_THEME=\".*\"/ZSH_THEME=\"$theme\"/1"

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# append user config
cat ./.zshrc >> $HOME/.zshrc

# set theme
sed -i "$sedcmd" ~/.zshrc
