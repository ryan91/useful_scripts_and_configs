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
# watch out - overwrites /bin/open
alias open=openFile
# enables executing files from current directory without using "./"
export PATH=$PATH:.
# get bigger history
export HISTSIZE=1500
# search for expression in history
alias shist=searchInHistory
# search for name in current directory
alias lg='searchInDirectory 1'
alias llg='searchInDirectory 2'
alias lllg='searchInDirectory 3'
