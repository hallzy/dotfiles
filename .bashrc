# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
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

# if [ "$color_prompt" = yes ]; then
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] $ ' #:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
#     PS1="${debian_chroot:+($debian_chroot)}\u@\h"  #:\w\$ '
# fi
# unset color_prompt force_color_prompt

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

    alias grep='grep --color=auto -n'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

source /etc/environment

REPOS=~/Documents/git-repos
dotfiles=~/Documents/git-repos/remote-github/dotfiles


exec /usr/games/fortune quotes | /usr/games/cowsay -f tux

get_crtime() {
  for target in "${@}"; do
    inode=$(stat -c '%i' "${target}")
    fs=$(df  --output=source "${target}"  | tail -1)
    crtime=$(sudo debugfs -R 'stat <'"${inode}"'>' "/dev/sda1" 2>/dev/null | grep -oP 'crtime.*--\s*\K.*')
    printf "%s\t%s\n" "${target}" "${crtime}"
  done
}

# Sets the Mail Environment Variable
MAIL=/var/spool/mail/steven && export MAIL

# Functions#{{{

sendtext () { curl http://textbelt.com/text -d number=$1 -d "message=$2";echo message sent; }

downloadMusic () { youtube-dl -o "${1}.%(ext)s" --extract-audio --audio-format mp3 $2; }

# up () - moves up x number of directories. eg. up 4#{{{
up () {
  local d=""
  limit=$1
  for ((i=1;i<=limit;i++))
  do
    d=$d/..
  done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}
#}}}

# tm is an easy to use manager of tmux {{{

tm () {
  # abort if we're already inside a TMUX session
  if [[ "$TMUX" != "" ]]; then
    exit 0
  fi

  # present menu for user to choose which workspace to open
  PS3="Please choose your session: "
  options=($(tmux list-sessions -F "#S") "New Session" "Remove Session")
  echo "Available sessions"
  echo "------------------"
  echo " "
  select opt in "${options[@]}"
  do
    case $opt in
      "New Session")
        read -p "Enter new session name: " SESSION_NAME
        tmux new -s "$SESSION_NAME"
        break;;
      "Remove Session")
        echo "Sessions to Delete: "
        select opt in "${options[@]}"
        do
          tmux kill-session -t $opt
        done
        break;;
      *)
        tmux attach-session -t $opt
        break;;
    esac
  done
}


#}}}

dev-tmux () {
  tmux source-file ~/.tmux.conf
  tmux new-session -d 'bash'
  tmux send-keys 'clear' C-m
  tmux new-window 'bash'
  tmux send-keys 'vim' C-m
  tmux split-window -v -p 30 'bash'
  tmux send-keys 'clear' C-m
  tmux split-window -h -p 50 'bash'
  tmux send-keys 'clear' C-m
  tmux select-pane -U
  tmux -2 attach-session -d
}

vimfind () {
  argument=${1-$(history -p \!\*)}

  # if argument is not empty open it in vim
  if [ -n "$argument" ]; then
    vim $(findcwd $argument)
  else
    echo "no argument specified."
  fi
}

#}}}

PS1="\e[0;31m${debian_chroot:+($debian_chroot)}\u@\h\e[m"
# Add Time stamp to bash prompt
export PS1="$PS1 \e[0;31m[\$(date +"%r")]\e[m"

# Bash Prompt Settings for SSH Sessions
# Both SSH_CLIENT and SSH_TTY should contain something if we are in an active
# ssh session. If they do contain something, we assume it is an ssh session and
# make the changes below
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  # Change colour of "git:" in git radar (the colour used by putty is the same as
  # background so I cannot see it.
  export GIT_RADAR_FORMAT=" \\x01\\033[0;36m\\x02git:(\\x01\\033[0m\\x02%{remote: }%{branch}%{ :local}\\x01\\033[0;36m\\x02)\\x01\\033[0m\\x02%{ :stash}%{ :changes}"
  # Add SSH: to the prompt ("SSH:" is cyan)
  export PS1="\e[0;36mSSH:\e[m $PS1"
fi

# Show 3 parent directories
PROMPT_DIRTRIM=3
export PS1="$PS1 \e[1;32m[\w]\e[m\n "

export PS1="$PS1\$(git-radar --bash --fetch) $ "


# helps me with typos in terminal:
# update with alias: update-thefuck
# install with alias: install-thefuck
eval $(thefuck --alias)

export EDITOR="/usr/bin/vim"

