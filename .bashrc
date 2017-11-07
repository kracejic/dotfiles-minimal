
#------------------------------------------------------------------------------
# default stuff

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#------------------------------------------------------------------------------
# custom

pathadd() {
    if [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}
pathadd "/home/${USER}/bin/"

# PS1="\[\033[38;5;215m\]\u@\h \[$(tput sgr0)\]\[\033[38;5;12m\]\w \[$(tput sgr0)\]"
PS1='\[\e[1;31m\]\u@\h\[\e[m\] \[\e[1;34m\]\w \[\e[0m\]'

alias ls="ls --color"
alias l="ls -alh"
alias ll="ls -alh"
alias lls="ls -lh --color"
alias cd..="cd .."
alias lsf="ls -al | grep -i"
alias psf="ps aux -A | grep -i"
alias psmem="ps aux --sort -rss"
alias grepp="grep -Rnsi"

alias g="git"

# easy find
findfunction() {
  find 2>/dev/null -L -iname "*$1*" ${@:2}
}
alias findn=findfunction
alias findbig="find ./ -type f -print0 | xargs -0 du | sort -n | tail -n 100 | cut -f2 | xargs -I{} du -sh {}"
alias findbigdir="find ./ -maxdepth 1 -type d -print0 | xargs -0 du --max-depth=1 | sort -n | tail -n 50 | tail -n +1 | cut -f2 | xargs -I{} du -sh {}"

alias sc="sudo systemctl"
alias sj="sudo journalctl"

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# set vi mode
# http://www.catonmat.net/blog/bash-vi-editing-mode-cheat-sheet/
set -o vi

# same installation commands
if [ -e /etc/yum.conf ] ; then
    alias ainstall="sudo yum install"
    alias areinstall="sudo yum reinstall"
    alias aremove="sudo yum remove"
    alias asearch="sudo yum search"
    alias ashow="sudo yum info"
    alias alistall="sudo yum installed"
    alias update="sudo yum update"
    alias upgrade="sudo yum update"
fi
if [ -e /etc/pacman.conf ] ; then
    alias pacman="pacman --color always"
    alias ainstall="sudo pacman --color always -S"
    alias areinstall="sudo pacman --color always -S"
    alias aremove="sudo pacman --color always -R"
    alias asearch="pacsearch"
    alias ashow="pacman --color always -Si"
    alias ashowfiles="pacman --color always -Qlq"
    alias ashowlocal="pacman --color always -Qi"
    alias alistall="pacman --color always -Q"
    alias alistallexplicit="pacman --color always -Qqe"
    alias update="sudo pacman --color always -Qu"
    alias upgrade="sudo pacman --color always -Syyu"
fi
if [ -d /etc/apt ] ; then
    alias ainstall="sudo apt-get install"
    alias areinstall="sudo apt-get install --reinstall"
    alias aremove="sudo apt-get --purge remove"
    alias asearch="sudo apt-cache search"
    alias ashow="sudo apt-cache show"
    alias alistall="sudo apt --installed list"
    alias update="sudo apt-get update"
    alias upgrade="sudo apt-get upgrade"
    alias uu="update && upgrade"
fi
if [ -d /mingw32 ] ; then
    alias pacman="pacman --color always"
    alias ainstall="pacman --color always -S"
    alias areinstall="pacman --color always -S"
    alias aremove="pacman --color always -RS"
    alias asearch="pacsearch"
    alias ashow="pacman --color always -Si"
    alias ashowfiles="pacman --color always -Qlq"
    alias ashowlocal="pacman --color always -Qi"
    alias alistall="pacman --color always -Q"
    alias update="pacman -Qu"
    alias upgrade="pacman -Syyu"
fi

# nice, more readable manual! This is a must
man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;38;5;74m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[46;30m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[04;38;5;146m' \
    man "$@"
}

# load custom promt and commands
if [ -f "$HOME/.promt" ]; then
  . "$HOME/.promt"
fi

#select best editor
if hash nvim 2>/dev/null; then
    export EDITOR=nvim
    export SUDO_EDITOR=nvim
    export GIT_EDITOR=nvim
    # fix Ctrl+H for neovim + tmux
    infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > ~/$TERM.ti ; tic ~/$TERM.ti
    alias vim="nvim"
elif hash vim 2>/dev/null; then
    export EDITOR=vim
    export SUDO_EDITOR=vim
    export GIT_EDITOR=vim
else
    export EDITOR=vi
    export SUDO_EDITOR=vi
    export GIT_EDITOR=vi
    alias vim="vi"
fi


