#####################################################################
###                     BASH GENERAL CONFIGS                      ###
#####################################################################

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

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#####################################################################
###                     BASH FUNCTIONS                            ###
#####################################################################

mcd() {
  mkdir -p "$1"
  cd "$1" || exit
}



#####################################################################
###                     BASH PROMPT                               ###
#####################################################################

# function parse_git_branch () {
#        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }

# RED="\[\033[0;31m\]"
# YELLOW="\[\033[0;33m\]"
# GREEN="\[\033[0;32m\]"
# GREY="\[\033[0;37m\]"
# PURPLE="\[\033[1;35m\]"
# LIGHTRED="\[\033[1;31m\]"
# NO_COLOUR="\[\033[0m\]"

# PS1="$LIGHTRED\w\$(parse_git_branch)$NO_COLOUR\$ "
# PS1="\n\[${BOLD}$GREEN\]\u \[$NO_COLOUR\]at \[$GREEN\]\h \[$NO_COLOUR\]in \[$LIGHTRED\]\w\[$NO_COLOUR\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on\")\[$PURPLE\]\$(parse_git_branch)\[$NO_COLOUR\]\n\$ "
# PS1="\[$LIGHTRED\]\w\[$NO_COLOUR\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on\")\[$PURPLE\]\$(parse_git_branch)\[$NO_COLOUR\]\n$ "

eval "$(starship init bash)"



#####################################################################
###                     BASH ALIASES                              ###
#####################################################################

# Dir navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias ll='ls -lF'
alias la='ls -lFA'
alias l='ls -CF'
alias cl='clear'
alias fuck='sudo !!'
alias mkdir='mkdir -pv'
alias mv='mv -i'
alias rmd='rm -r'
alias mirrorvga='xrandr --output VGA1 --mode 1024x768 --same-as LVDS1'
alias screenshot='flameshot'
alias startserver='python -m SimpleHTTPServer'
alias pdftex='pdflatex --synctex=1'
alias space='df -h'
alias getpassword='pwgen -csnyB1 32 | xclip -sel clip'
alias gs='git status -sb'
alias xc='xclip -sel clip'
alias cat='bat'

# Docker
alias deb='container_id=$(docker ps -a | fzf | awk "{print $1}"); docker exec -ti $container_id bash'

# Software - curses
alias files='ranger'
alias pdf='mupdf'
alias music='cmus'
alias mail='mutt'
alias network='wicd-curses'
alias chat='irssi'
alias im='finch'
alias twitter='turses'
alias processing='/usr/share/processing/processing &'
alias torrent='torrentflix'
alias spotify='spotify --force-device-scale-factor=2'
#https://github.com/ItzBlitz98/torrentflix

# Utilities
#alias a="ack -ia"
alias du="du -h -s"
alias g="git"
alias grep='GREP_COLOR="1;37;45" LANG=C grep --color=auto'
alias h="history"
alias ip="curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g'"




#####################################################################
###                     BASH EXPORTS                              ###
#####################################################################

export EDITOR=vim
export WORKON_HOME="~/env"
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    source /usr/bin/virtualenvwrapper.sh
fi
export NODE_PATH="/usr/bin/nodejs"
export GEM_HOME="$HOME/gems"
export GOPATH="/home/pr3ssh/gocode"
# source /etc/bash_completion.d/password-store
export PATH="$HOME/.gem/ruby/2.7.0/bin:$HOME/gems/bin:/usr/local/heroku/bin:/usr/share/processing:~/.cabal/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh"  ] && . "$NVM_DIR/nvm.sh" # This loads nvm



########################################V#############################
###                     BASH STARTS WITH                          ###
#####################################################################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FASD and Z
eval "$(fasd --init auto)"
. /usr/bin/z.sh

# Install Ruby Gems to ~/gems
export PATH="$HOME/gems/bin:$PATH"
