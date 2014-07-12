# list longer
alias ll='ls -lha --color'
# list very long
alias lll='ls -lishaA --color'
# open uni_tue_template.cls
alias utt='vim \
/home/ryan91/Documents/Uni_Tuebingen/git/uni_tue_template/uni_tue_template.cls'
openFile() {
	xdg-open "${1}" &
}
searchInHistory() {
	history | grep -E "${1}"
}
searchInDirectory() {
  if [ "${1}" == 1 ]; then
    ls | grep -E "${2}"
  elif [ "${1}" == 2 ]; then
    ll | grep -E "${2}"
  elif [ "${1}" == 3 ]; then
    lll | grep -E "${2}"
  else
    echo "error in .bashrc!"
  fi
}
silentBackgroundJob() {
  if [ ${#} == 1 ]; then
    $1 > /dev/null 2>&1 &
  else
    echo "Please set one parameter."
  fi
}

# setup rm -> move to trash alias environment
TRASH='/tmp/trash'
if [ ! -d "$TRASH" ]; then
    mkdir "$TRASH"
fi
move_to_trash() {
    # quick fix for desktop
    # TODO solve this problem properly
    if [[ $(pwd) == /storage* ]]; then
        remove "$@"
    else
        mv "$@" "$TRASH"
    fi
}
alias remove='\rm'
alias rm='move_to_trash'
alias emptytrash="remove -rf $TRASH/*"

# watch out - overwrites /bin/open
alias open=openFile

# enables executing files from current directory without using "./"
export PATH=$PATH:.

# get bigger history
export HISTSIZE=1500

# search for expression in history
alias shist=searchInHistory

# define custom $PS1
PS1='\[\033[01;33m\]\u\[\033[00;36m\]@\[\033[00;31m\]\W\[\033[00;36m\]:\[\033[00m\] '

# search for name in current directory
alias lg='searchInDirectory 1'
alias llg='searchInDirectory 2'
alias lllg='searchInDirectory 3'
alias sjob=silentBackgroundJob

# wrapper for stdout -> clipboard
alias clipboard='xargs printf | xclip -sel C'
