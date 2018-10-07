#!/bin/bash

sudo pacman -S --noconfirm i3-manjaro manjaro-i3-solarized-settings

# copy to home folder to install solarized settings
cp -rf /etc/skel/.* $HOME

# Use ~/.config/i3/config instead of ~/.i3/config
rm -rf $HOME/.i3

# overwrite specific files with custom configuration
cp -rf ./files/* $HOME
