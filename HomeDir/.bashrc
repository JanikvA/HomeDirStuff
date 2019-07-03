# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# stty -ixon

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
HISTSIZE=100000
HISTFILESIZE=200000

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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
alias ll='ls -ltrh'
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

# # enable programmable completion features (you don't need to enable
# # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# # sources /etc/bash.bashrc).
# if ! shopt -oq posix; then
#   if [ -f /usr/share/bash-completion/bash_completion ]; then
#     . /usr/share/bash-completion/bash_completion
#   elif [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
#   fi
# fi


alias naf='ssh ahnenjan@naf-atlas.desy.de -X -Y'
alias lx='ssh jvonahne@lxplus.cern.ch -X -Y'
#alias python='python3'
alias notes='vi ~/Dropbox/Notes/TODO.md ~/Dropbox/Notes/NOTES.md'
alias talks='cd ~/Dropbox/Master/TEXtalks'
alias thisroot='source /home/janik/ROOTinstall/root/bin/thisroot.sh'
alias root='root -l'
alias v='vi'
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias acmSetup="source ~/acmDev/acm/acmSetup.sh"
alias getTags="ctags -R"
alias mail="v ~/scratch/mail.txt"
alias gpom="git push origin master"
alias TODO='git ls-files | xargs cat | grep TODO'

function cl {
    builtin cd "$@" && ls -F
    }

alias mntlx='sudo sshfs -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3,allow_other jvonahne@lxplus.cern.ch:/afs/cern.ch/user/j/jvonahne/ /mnt/lxplus'
alias mntdust='sudo sshfs -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3,allow_other ahnenjan@naf-atlas.desy.de:/nfs/dust/atlas/user/ahnenjan/phd /mnt/dust'
alias unmntdust='sudo fusermount -uz /mnt/dust'
alias mntafs='sudo sshfs -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3,allow_other ahnenjan@naf-atlas.desy.de:/afs/desy.de/user/a/ahnenjan/Code /mnt/code'
alias unmntafs='sudo fusermount -uz /mnt/code'

alias scndMonitor='xrandr --output HDMI1 --auto --right-of eDP1'
alias thesis='cd /home/janik/Dropbox/Master/thesis && vim -S Session.vim'
alias updatePLaylist='youtube-dl --config-location ~/.config/youtube-dl/downloadPL "https://www.youtube.com/watch?v=TMWXNueRYlg&list=PLtwVsjVoAQEwJ-SpewJUBRU_DvqWceIFG&index=2&t=0s"'
alias getScratchPlots='scp ahnenjan@naf-atlas.desy.de:/nfs/dust/atlas/user/ahnenjan/scratch/Plots/* /home/janik/cernbox/scratchPlots'

shopt -s autocd

set -o vi
bind '"kj":vi-movement-mode'

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]$ "

export PATH=~/bin:$PATH

export EDITOR=/usr/local/bin/vim

# Setup fzf
# ---------
if [[ ! "$PATH" == */home/janik/.fzf/bin* ]]; then
  export PATH="$PATH:/home/janik/.fzf/bin"
fi

export FZF_ALT_C_COMMAND='fd --type d --follow --exclude .git'
export FZF_DEFAULT_COMMAND='fd --follow --exclude .git'


# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/janik/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/janik/.fzf/shell/key-bindings.bash"
# export FZF_DEFAULT_COMMAND=
source /home/janik/ROOTinstall/root/bin/thisroot.sh

echo ".bashrc has been executed"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
