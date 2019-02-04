
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd
unsetopt beep
bindkey -v

alias ls='ls --color=auto'
alias ll='ls -lhA --color'
alias grep='grep --color=auto'
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
export u1='..'
export u2='../..'
export u3='../../..'
export u4='../../../..'
export u5='../../../../..'
alias vim='nvim'
