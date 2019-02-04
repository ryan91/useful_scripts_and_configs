#!/bin/bash

set -e

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/in
stall.sh)"

# overwrite with custom config
cp -f ./.zshrc $HOME
