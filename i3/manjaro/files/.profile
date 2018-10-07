#
# ~/.profile
#
#

[[ "$XDG_CURRENT_DESKTOP" == "KDE" ]] || export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nano

[[ -f ~/.extend.profile ]] && . ~/.extend.profile

export TERMINAL=/usr/bin/urxvtc
export EDITOR=/usr/bin/nvim
