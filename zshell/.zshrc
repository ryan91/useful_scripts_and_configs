# ============================================================================
# FILE NAME:  .zshrc
# AUTHOR:     Yannick Runge
# PURPOSE:    Sets up the zsh environment
# ============================================================================
# Function declarations
# ============================================================================
xdg_open() {
  if [ ${#} -eq 1 ]; then
    if [ -f "$1" ]; then
      xdg-open "$1" > /dev/null 2>&1 &
      return 0
    else
      (>&2 echo "not a file: $1")
      return 1
    fi
  else
    (>&2 echo "usage: <xdg_open> <file name>")
    return 1
  fi
}
# ============================================================================
# Alias declarations
# ============================================================================
alias fopen='xdg_open'
alias ls='ls --color=auto'
alias ll='ls -lhA --color'
alias grep='grep --color=auto'
alias pacupdate='sudo pacman -Syu'
alias pacsearchinst='pacman -Qe'
alias pacsearchrem='pacman -Ss'
alias pacinfo='pacman -Si'
alias pacinstall='sudo pacman -Sy'
alias pacremove='sudo pacman -Rs'
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
# ============================================================================
# Environment variable declarations
# ============================================================================
# ...
# ============================================================================
# Apricity OS out of the box stuff
# ============================================================================
source /usr/share/zsh/site-contrib/powerline.zsh
zstyle ':completion:*' menu select
# ============================================================================
