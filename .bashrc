# default stuff

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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
# PS1='\[\e[1;31m\]\u@\h\[\e[m\] $MSYSTEM \[\e[1;34m\]\w \[\e[0m\]'
PS1='\[\e[1;31m\]\u@\h\[\e[m\] \[\e[1;34m\]\w \[\e[0m\]'

# Run ssh agent only once, ignore gnome-keyring
if ! pgrep -u "$USER" -f -x "^ssh-agent$" > /dev/null; then
    echo "starting ssh agent"
    ssh-agent > ~/.ssh-agent-thing
    eval "$(<~/.ssh-agent-thing)" /dev/null
fi
if [ -f ~/.ssh-agent-thing ]; then
    eval "$(<~/.ssh-agent-thing)" > /dev/null
fi

alias ls="ls --color --group-directories-first"
alias l="ls -alh --group-directories-first"
alias ll="ls -lh --group-directories-first"
alias lls="ls -lh --color --group-directories-first"
alias cd..="cd .."
alias lsf="ls -al --group-directories-first | grep -i"
alias psf="ps aux -A | grep -i"
alias psmem="ps aux --sort -rss"
alias grepp="grep -Rnsi"
alias c="clear"
alias ip="ip -color=always"
alias ips="ip -color=always -br a"

alias g="git"

alias makep="prettyfier make"
alias cmakep="prettyfier cmake"
alias ninjap="prettyfier ninja"

# easy find
findfunction() {
  find 2>/dev/null -L -iname "*$1*" ${@:2}
}
alias findn=findfunction
alias findbig="find ./ -type f -print0 | xargs -0 du | sort -n | tail -n 100 | cut -f2 | xargs -I{} du -sh {}"
alias findbigdir="find ./ -maxdepth 1 -type d -print0 | xargs -0 du --max-depth=1 | sort -n | tail -n 50 | tail -n +1 | cut -f2 | xargs -I{} du -sh {}"

alias sc="sudo systemctl"
alias scg="systemctl | grep -i "
alias sj="sudo journalctl"
alias sl="sudo journalctl -e"
alias sjf="sudo journalctl -f"
alias slf="sudo journalctl -f"
alias sju="sudo journalctl -e -u"
alias slu="sudo journalctl -e -u"
alias sjuf="sudo journalctl -f -u"
alias sluf="sudo journalctl -f -u"
alias sjfu="sudo journalctl -f -u"
alias slfu="sudo journalctl -f -u"

# export http_proxy="http://194.138.0.11:9400"
# export https_proxy="https://194.138.0.11:9400"
# export ftp_proxy="ftp://194.138.0.11:9400"
# export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"

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
    alias asearch="pacman --color always -Ss"
    alias ashow="pacman --color always -Si"
    alias ashowfiles="pacman --color always -Qlq"
    alias ashowlocal="pacman --color always -Qi"
    alias alistall="pacman --color always -Q"
    alias alistallexplicit="pacman --color always -Qqe"
    alias update="sudo pacman --color always -Qu"
    alias upgrade="sudo pacman --color always -Syu"
    alias upgradeforce="sudo pacman --color always -Syyu"
fi
if [ -d /etc/apt ] ; then
    alias ainstall="sudo apt install"
    alias areinstall="sudo apt install --reinstall"
    alias aremove="sudo apt-get --purge remove"
    alias asearch="apt search"
    alias ashow="apt show"
    alias alistall="apt --installed list"
    alias update="sudo apt update"
    alias upgrade="sudo apt upgrade"
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

## set some other defaults ##
alias df="df -hT"
alias du='du -ch'
alias less_="less"
alias less="less -r"
alias grep='grep --color'
alias grep_="grep --color=never"
alias grep="grep --color=always"

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# for badly configured servers
alias ssh_nopubkey="ssh -o PubkeyAuthentication=no"


## pass options to free ##
alias meminfo='free -m -l -t'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

alias updateycm='cd ~/.vim/bundle/YouCompleteMe && git pull && git pull --recurse-submodules && ./install.py --clang-completer'
alias updateycmall='cd ~/.vim/bundle/YouCompleteMe && git pull && git pull --recurse-submodules && ./install.py --clang-completer --gocode-completer --tern-completer'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

## Get server cpu info ##
alias cpuinfo='lscpu'

alias vimlog='sed -r "s/\x1B\[([0-9];)?([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g" | vim -R -c "set filetype=log nowrap" -'

weather() {
curl -s wttr.in/$1
}


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

# set vi mode
# http://www.catonmat.net/blog/bash-vi-editing-mode-cheat-sheet/
set -o vi

# set color TERM
test $TERM = xterm && TERM=xterm-256color

# bind home and end to ESC+insert on ^ and $
# http://stackoverflow.com/questions/4200800/in-bash-how-do-i-bind-a-function-key-to-a-command
# http://www.gnu.org/software/bash/manual/html_node/Bash-Builtins.html
# Not needed on most system, needed on ubuntu... :(
if [ -f /etc/lsb-release ]; then
    if [ $(grep Ubuntu /etc/lsb-release | wc -l) != "0" ] ; then
        bind -m vi-insert '"\e[1~":"\eI"'
        bind -m vi-insert '"\e[4~":"\eA"'
        bind -m vi '"\e[1~":"^"'
        bind -m vi '"\e[4~":"$"'
    fi
fi
# page up and page down
bind -m vi '"\e[5~":"\e[A"'
bind -m vi-insert '"\e[5~":"\e[A"'
bind -m vi '"\e[6~":"\e[B"'
bind -m vi-insert '"\e[6~":"\e[B"'

#------------------------------------------------------------------------------
# select best editor
if hash nvim 2>/dev/null; then
    export EDITOR=nvim
    export SUDO_EDITOR=nvim
    export GIT_EDITOR=nvim
    # fix Ctrl+H for neovim + tmux
    infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > ~/$TERM.ti ; tic ~/$TERM.ti
    alias vim="nvim"
    alias suvim="sudo -E nvim"
elif hash vim 2>/dev/null; then
    export EDITOR=vim
    export SUDO_EDITOR=vim
    export GIT_EDITOR=vim
    alias suvim="sudo -E vim"
else
    export EDITOR=vi
    export SUDO_EDITOR=vi
    export GIT_EDITOR=vi
    alias vim="vi"
    alias suvim="sudo -E vi"
fi


