# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
export TERM=xterm-256color
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

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;96m\]\u@\h\[\033[00m\]:\[\033[01;37m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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

LS_COLORS="ow=01;36;40"
LS_COLORS=$LS_COLORS:'di=1;36:'
export LS_COLORS


#P4
export P4USER=rizwanm
#export P4CLIENT=timm_aix71_build
export P4PORT=10.52.114.110:1667
#for mobaxterm
export DISPLAY=:10.0
#SOLARIS
alias sol10u5='ssh root@10.203.136.249'
alias sol10='ssh root@10.203.151.164'
alias sol11='ssh root@10.203.136.18'
alias sol10x='ssh root@10.203.136.24'
alias sol11x='ssh root@10.203.136.25'
alias sol11u4='ssh root@10.203.136.86'
#alias sol11u4x='ssh root@10.203.136.25'



######### Solaris servers ###########
alias netra='ssh root@10.203.136.31'
alias t2000='ssh root@10.203.138.190'
alias t2000-2='ssh root@10.203.138.210'
alias s72='ssh root@10.203.138.150'
alias t71='ssh root@10.203.151.159'



alias dsm='ssh root@10.203.136.128'
alias aix72='ssh 10.203.138.108'
alias aix='ssh 10.203.138.133'
alias aix2='ssh 10.203.138.135'
alias aix71='ssh 10.203.138.107'
alias aix61='ssh root@10.203.136.29'
alias aixqa='ssh root@10.203.151.130'
alias ubun='ssh administrator@10.203.176.215'
alias cscopegen='cscope -q -R -b -i cscope.files'
alias cscopegen='find . -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.h" -o -name "*.hh" -o -name "*.hpp" > cscope.files && cscope -q -R -b -i cscope.files'
alias download='cd /mnt/c/Users/rizwanm/Downloads/'
 
function setssh() { cat .ssh/id_rsa.pub | ssh "$@" 'mkdir -p .ssh; cat >> .ssh/authorized_keys'; ssh "$@"; }

export PATH=$HOME/local/bin:$PATH
export windows=rizwanm@10.52.117.142:/cygdrive/c/Users/rizwanm/Downloads
