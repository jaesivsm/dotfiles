#!/bin/bash
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias l='ls -lh'
alias la='ls -A'
alias ll='ls -lh'
alias lla='ls -lhA'
alias lg='ls -A | grep'
alias llg='ls -lhA | grep'
alias clean='find . \( -name "*.pyc" -o -name "*~" \) -delete'
alias serv='python -m SimpleHTTPServer'
alias rsync='rsync --exclude="*.o" --exclude="*.so" --exclude="*~" --exclude="*.swp" --exclude="*.pyc" --exclude=".git/*"'

bim() {
    echo "BIM $@ !"
}

grepk() {
	grep -ER --binary-files=without-match --exclude-dir=".webassets-cache" --exclude-dir=".git" --exclude-dir="venv" --exclude-dir="build" --exclude-dir="static" --exclude-dir="site-packages" --exclude-dir="gen"  --exclude="*~" --exclude="*.pyc" --exclude="*.min.js" --exclude="*.swp" "$*" .
}
# Chercher dans les process et non pas le club de foot
psg() {
	ps aux |  sed -e "/grep --color=auto $1/d" | grep "$*"
}

vimgrepk() {
    vim $(grepk "$*" |sed -e "s/:.*//g"|uniq)
}

vimOgrepk() {
    vim -O $(grepk "$*" |sed -e "s/:.*//g"|uniq)
}
