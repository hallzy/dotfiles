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
HISTSIZE=2000
HISTFILESIZE=2000

# Commands to ignore and not put into our history
export HISTIGNORE="clear:history"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" colour)
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

# Uncomment for a coloured prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_colour_prompt=yes

# Shellcheck ignore this as it was a default that came with ubuntu
# shellcheck disable=SC2154
if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have colour support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
# Shellcheck ignore this as it was a default that came with ubuntu
# shellcheck disable=SC2034
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

# enable colour support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  # Shellcheck ignore this as it was a default that came with ubuntu
  # shellcheck disable=SC2015
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || \
    eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  # Shellcheck ignore this as it was a default that came with ubuntu
  # shellcheck disable=SC2032
  alias grep='grep --color=auto -n -I'
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

export REPOS=~/Documents/git-repos
export dotfiles=~/Documents/git-repos/remote-github/dotfiles

/usr/games/fortune quotes | /usr/games/cowsay -f tux


# Sets the Mail Environment Variable
MAIL=/var/spool/mail/steven && export MAIL

# Functions#{{{

# Git add files matching a regex
ga () {
  # Shellcheck ignore because I possibly want splitting
  # Also, grep isn't a command, its an argument
  # shellcheck disable=SC2046,SC2033
  git add $(find . -regextype grep -regex ".*/[\.]\{0,1\}${1}")
}

screencast () { mplayer -tv driver=v4l2:width=320:height=240: -vo xv tv:// -geometry "99%:95%" -noborder -ontop; }

sendtext () { curl http://textbelt.com/text -d number="$1" -d "message=$2";echo message sent; }

downloadMusic () {
  sudo youtube-dl -U
  youtube-dl -o "${1}.%(ext)s" --extract-audio --audio-format mp3 "$2"
}

downloadVideo () {
  sudo youtube-dl -U
  youtube-dl -o "${1}.%(ext)s" "$2"
}

trimVideo () {
  if [ "$#" -eq 4 ]; then
    ffmpeg -i "${1}" -vcodec copy -acodec copy -ss "${3}" -t "${4}" "${2}"
    return
  fi

  if [ "$#" -eq 5 ]; then
    if [ "$5" == "no-audio" ]; then
      ffmpeg -i "${1}" -vcodec copy -acodec copy -ss "${3}" -t "${4}" -an "${2}"
      return
    fi
  fi

  echo "Expected: source_video dest_video start_time duration (optional: no-audio)"
  echo "start_time and duration are of the form hh:mm:ss"
}

joinVideo () {
  if [ "$#" -eq 3 ]; then
    MP4Box -add "${1}" -cat "${2}" -new "${3}"
    return
  fi

  echo "Expected: video name 1, video name 2, output video name"
}

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

  # present menu for user to choose which work space to open
  PS3="Please choose your session: "
  session_path=~/.tmp_tmux
  mkdir -p $session_path
  if (($(stat -c "%a" $session_path) != 777)); then
    sudo chmod 777 $session_path
  fi
  options=("New Session" "Attach To Session" "Attach To Session From CWD" "Remove Session")
  echo "Available sessions"
  echo "------------------"
  echo " "
  select opt in "${options[@]}"
  do
    case $opt in
      "New Session")
        read -p "Enter new session name: " SESSION_NAME
        tmux -S "$session_path"/"$SESSION_NAME"
        cd -
        break;;
      "Attach To Session")
        ls -1 $session_path
        read -p "Enter session name: " SESSION_NAME
        if (($(stat -c "%a" "$session_path"/"$SESSION_NAME") < 666)); then
          sudo chmod 666 "$session_path"/"$SESSION_NAME"
        fi
        failed=0
        tmux -S "$session_path"/"$SESSION_NAME" attach || failed=1
        if (( failed == 1 )); then
          echo "Session either does not exist, or it is inactive"
          echo "Deleting Session"
          rm -rf "${session_path:?}"/"$SESSION_NAME"
          echo "Creating new session"
          tmux -S "$session_path"/"$SESSION_NAME"
        fi
        break;;
      "Attach To Session From CWD")
        cd -
        ls -1
        read -p "Enter session name: " SESSION_NAME
        if (($(stat -c "%a" "${PWD}"/"$SESSION_NAME") < 666)); then
          sudo chmod 666 "${PWD}"/"$SESSION_NAME"
        fi
        tmux -S "${PWD}"/"$SESSION_NAME" attach
        break;;
      "Remove Session")
        ls -1 $session_path
        read -p "Session to Delete: " SESSION_NAME
        rm -rf "${session_path:?}"/"$SESSION_NAME"
        break;;
      *)
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
    # Shellcheck ignore this as I may want word splitting
    # shellcheck disable=SC2046
    vim $(findcwd "$argument")
  else
    echo "no argument specified."
  fi
}

md5dir () {
  # if argument is not empty cd into it
  if [ -n "$1" ]; then
    cd "$1"
  fi
  filename=$(basename "$PWD")
  hash=$(find . -xtype f -print0 | xargs -0 md5sum | cut -d" " -f1 | sort | \
         md5sum | cut -d" " -f1)
  echo "${hash}  ${filename}/"

  if [ -n "$1" ]; then
    cd - > /dev/null
  fi
}

sha1dir () {
  # if argument is not empty cd into it
  if [ -n "$1" ]; then
    cd "$1"
  fi
  filename=$(basename "$PWD")
  hash=$(find . -xtype f -print0 | xargs -0 sha1sum | cut -d" " -f1 | sort |
         sha1sum | cut -d" " -f1)
  echo "${hash}  ${filename}/"
  if [ -n "$1" ]; then
    cd - > /dev/null
  fi
}

sha224dir () {
  # if argument is not empty cd into it
  if [ -n "$1" ]; then
    cd "$1"
  fi
  filename=$(basename "$PWD")
  hash=$(find . -xtype f -print0 | xargs -0 sha224sum | cut -d" " -f1 | sort |
         sha224sum | cut -d" " -f1)
  echo "${hash}  ${filename}/"
  if [ -n "$1" ]; then
    cd - > /dev/null
  fi
}

sha256dir () {
  # if argument is not empty cd into it
  if [ -n "$1" ]; then
    cd "$1"
  fi
  filename=$(basename "$PWD")
  hash=$(find . -xtype f -print0 | xargs -0 sha256sum | cut -d" " -f1 | sort |
         sha256sum | cut -d" " -f1)
  echo "${hash}  ${filename}/"
  if [ -n "$1" ]; then
    cd - > /dev/null
  fi
}

sha384dir () {
  # if argument is not empty cd into it
  if [ -n "$1" ]; then
    cd "$1"
  fi
  filename=$(basename "$PWD")
  hash=$(find . -xtype f -print0 | xargs -0 sha384sum | cut -d" " -f1 | sort |
         sha384sum | cut -d" " -f1)
  echo "${hash}  ${filename}/"
  if [ -n "$1" ]; then
    cd - > /dev/null
  fi
}

sha512dir () {
  # if argument is not empty cd into it
  if [ -n "$1" ]; then
    cd "$1"
  fi
  filename=$(basename "$PWD")
  hash=$(find . -xtype f -print0 | xargs -0 sha512sum | cut -d" " -f1 | sort |
         sha512sum | cut -d" " -f1)
  echo "${hash}  ${filename}/"
  if [ -n "$1" ]; then
    cd - > /dev/null
  fi
}

uninstall () {
  sudo apt purge "$@" && sudo apt autoremove
}

install-thefuck () {
  wget -O - https://raw.githubusercontent.com/nvbn/thefuck/master/install.sh | \
    sh - && $0
}

#}}}


# Operating Systems that I have tested that fit into one of these categories:
# Ubuntu
# Manjaro Mate
# Antergos
if [ -f /etc/debian_version ]; then
  OS="Debian"
elif [ -f /etc/manjaro-release ]; then
  OS="Manjaro"
elif [ -f /etc/arch-release ]; then
  OS="Arch"
elif [ -f /etc/windows ]; then
  # This file does not exist by default in git bash
  OS="Windows"
else
  OS="none"
fi

export OS

# Add my scripts to the path
export PATH=$PATH:$HOME/.my-scripts
# This bin folder will be for scripts that are not mine... Such as git-radar
export PATH=$PATH:$dotfiles/.bin
# This bin folder is for go scripts I have downloaded/installed
export PATH=$PATH:$HOME/go/bin

PROMPT_COMMAND=__prompt_command

__prompt_command() {
  ## Get the exit code of the last command that was run
  exit="$?"
  PS1=""

  # All Colours I used are from the gruvbox pallet -- .vim/plugged/gruvbox/colors/
  # find colour codes here: # http://misc.flogisoft.com/bash/tip_colors_and_formatting
  # Colour Codes
  # NOTE: the background colour of the terminal is #282828
  #       the text colour of the terminal is #AAAAAA (not part of gruvbox)
  #       the font of the terminal is "DejaVu Sans Mono"
  #       the font size of the terminal is 9
  red="\e[38;5;167m"    # Hex = d75f5f
  blue="\e[38;5;109m"   # Hex = 87afaf
  yellow="\e[38;5;142m" # Hex = afaf00
  end_colour="\e[m"

  PS1="${red}${debian_chroot:+($debian_chroot)}\u@\h"
  # Add Time stamp to bash prompt
  if [[ $OS != "Windows" ]]; then
    # Don't get the date if we are running windows. The date function does not
    # seem to work
    export PS1="$PS1 ${red}[\$(date +%r)]"
  fi
  PS1+=" ${blue}RET=${exit}${end_colour}"

  # Bash Prompt Settings for SSH Sessions
  # Both SSH_CLIENT and SSH_TTY should contain something if we are in an active
  # ssh session. If they do contain something, we assume it is an ssh session and
  # make the changes below
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    # Change colour of "git:" in git radar (the colour used by putty is the same as
    # background so I cannot see it.
    export GIT_RADAR_FORMAT="\\x01\\033[38;5;109m\\x02git:(\\x01\\033[0m\\x02%{remote: }%{branch}%{ :local}\\x01\\033[38;5;109m\\x02)\\x01\\033[0m\\x02%{ :stash}%{ :changes}"
    # Add SSH: to the prompt ("SSH:" is cyan)
    export PS1="${blue}SSH:${end_colour} $PS1"
  fi

  # Show 3 parent directories
  PROMPT_DIRTRIM=3
  export PS1="$PS1 ${yellow}[\w]${end_colour}\n "

  history -a;

  export PS1+="\$(git-radar --bash --fetch) "
  ## Add this line to easily switch to my local fork for checking changes
  # export PS1="$PS1\$(/home/steven/Documents/git-repos/repos-i-contribute-to/git-radar/git-radar --bash --fetch) "

  # This is a command to check if we have sudo privileges currently
  sudo -n true 2> /dev/null
  is_root=$?
  ## If we are root or we have sudo privileges then let us know
  if [[ $USER == "root" ]]; then
    echo -ne "\033]0;ROOT SHELL\007"
    export PS1+="${red}ROOT SHELL${end_colour} $ "
  elif [[ $is_root == 0 ]]; then
    echo -ne "\033]0;ELEVATED PRIVILEGES\007"
    export PS1+="${red}ELEVATED PRIVILEGES${end_colour} $ "
  else
    echo -ne "\033]0;Terminal\007"
    export PS1+="$ "
  fi
}


# helps me with typos in terminal:
# update with alias: update-thefuck
# install with alias: install-thefuck
  # Shellcheck ignore this as I need word splitting for this
  # shellcheck disable=SC2046
eval $(thefuck --alias)

## Some Defaults
export EDITOR="/usr/bin/vim"
export editor="/usr/bin/vim"
### As far as I know this isn't used for anything by default, but I will use it
### for my own stuff including my "git open" alias. Whenever I used the commands
### that are supposed to open my default browser it always opens up chrome
### instead for some reason, so this is my way of getting around it.
export BROWSER="/usr/bin/palemoon"
export browser="/usr/bin/palemoon"

export NVM_DIR="/home/steven/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# Setup the ls colours
LS_COLORS=$LS_COLORS:'di=38;5;142:'
LS_COLORS=$LS_COLORS:'ln=38;5;109:'
LS_COLORS=$LS_COLORS:'or=38;5;208:'
LS_COLORS=$LS_COLORS:'ex=38;5;167:'
LS_COLORS=$LS_COLORS:'fi=38;5;229:'
export LS_COLORS

export GOPATH="$HOME/go"
