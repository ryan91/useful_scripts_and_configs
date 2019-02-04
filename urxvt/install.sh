#!/bin/bash

set -e

BackupDir="$HOME/.x_backup"
Xrec="$HOME/.Xresources"
Xdef="$HOME/.Xdefaults"
FontDir="$HOME/.fonts/Meslo"
ThisDir="$PWD"

if [ -f $HOME/.Xresources ] || [ -f $HOME/.Xdefaults ]; then
  printf "Backing up old config..."
  mkdir -p "$BackupDir"
  if [ -f $Xrec ]; then
    cp -f "$Xrec" "$BackupDir"
  fi
  if [ -f "$Xdef" ]; then
    cp -f "$Xdef" "$BackupDir"
  fi
  printf "Done\n"
fi

mkdir -p "$FontDir"

cd "$FontDir"

printf "Downloading Meslo font..."
wget -q 'https://github.com/powerline/fonts/blob/master/Meslo%20Dotted/Meslo%20LG%20M%20DZ%20Regular%20for%20Powerline.ttf?raw=true'
wget -q 'https://github.com/powerline/fonts/blob/master/Meslo%20Dotted/Meslo%20LG%20M%20DZ%20Italic%20for%20Powerline.ttf?raw=true'
wget -q 'https://github.com/powerline/fonts/blob/master/Meslo%20Dotted/Meslo%20LG%20M%20DZ%20Bold%20for%20Powerline.ttf?raw=true'
wget -q 'https://github.com/powerline/fonts/blob/master/Meslo%20Dotted/Meslo%20LG%20M%20DZ%20Bold%20Italic%20for%20Powerline.ttf?raw=true'
printf "Done\n"

cd "$ThisDir"

printf "Refreshing font cache..."
fc-cache -f "$FontDir"
printf "Done\n"

printf "Copying X config files..."
cp -f ./.Xresources "$Xrec"
cp -f ./.Xdefaults "$Xdef"
printf "Done\n"

printf "Refreshing X resource database..."
xrdb "$Xrec"
xrdb -merge "$Xdef"
printf "Done\n"
