#!/bin/bash
export HOME=/home/steven

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

# Expand directories when tab is pressed. This helps with variables that I use
# for folders
shopt -s direxpand

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

export REPOS=/home/steven/Documents/git-repos
export dotfiles=/home/steven/Documents/git-repos/remote-github/dotfiles

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

screencast () {
    mplayer -tv driver=v4l2:width=320:height=240: -vo xv tv:// -geometry "99%:95%" -noborder -ontop;
}

sendtext () { curl http://textbelt.com/text -d number="$1" -d "message=$2";echo message sent; }

downloadMusic () {
    youtube-dl -U
    youtube-dl -o "%(uploader)s --- %(title)s.%(ext)s" --extract-audio --audio-format mp3 "$1"
}

downloadVideo () {
    youtube-dl -U
    youtube-dl -o "%(uploader)s --- %(title)s.%(ext)s" "$1"
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
    local limit="$1"

    if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
        limit=1
    fi

    for ((i=1;i<=limit;i++)); do
        d="../$d"
    done

    if ! cd "$d"; then
        echo "Couldn't go up $limit dirs."
    fi
}
#}}}

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

getsize() {
    local path;
    path="$1"

    # If no argument, then it is current directory so no chance of it being a
    # symlink or a file
    if [ -z "$path" ]; then
        path="."
    fi

    # If argument is a symlink
    if [ -h "$path" ]; then
        # Get the path that the link points to
        path="$(readlink -f "$path")"
    fi

    # If first arg is not empty, or it is a directory and not a symlink
    if [ -d "$path" ]; then
        find "$path" -xtype f -exec du -sb {} \; | __filesize_awk
    # If first arg is a file and is not a symlink
    elif [ -f "$path" ]; then
        du -sb "$path" | __filesize_awk
    else
        echo "The path provided is not a file or folder"
    fi
}

__filesize_awk() {
    awk '
        {
            TOTAL += $1;
        }

        END {
            print TOTAL " B";

            KB = TOTAL / (10 ** 3);
            KiB = TOTAL / (2 ** 10);
            if (KB < 1) {
                exit
            }
            printf "%0.2f KB (%0.2f KiB)\n", KB, KiB;

            MB = TOTAL / (10 ** 6);
            MiB = TOTAL / (2 ** 20);
            if (MB < 1) {
                exit
            }
            printf "%0.2f MB (%0.2f MiB)\n", MB, MiB;

            GB = TOTAL / (10 ** 9);
            GiB = TOTAL / (2 ** 30);
            if (GB < 1) {
                exit
            }
            printf "%0.2f GB (%0.2f GiB)\n", GB, GiB;
        }
    '
}

hashdir_helper() {
    local cmd
    local hash
    local filename
    local dir

    # Dir is second arg to this function, or current directory otherwise
    dir="$2"
    if [ -z "$dir" ]; then
        dir="."
    fi

    if [ ! -d "$dir" ]; then
        echo "'$dir' is not a directory"
        return;
    fi

    cd "$dir"
    if [ $? -ne 0 ]; then
        return;
    fi

    # Default to md5sum if not provided
    if [ -z "$1" ]; then
        cmd='md5sum'
    else
        cmd="$1"
    fi

    filename=$(basename "$PWD")
    hash=$($cmd <(find . -xtype f -print0 | xargs -0 $cmd | awk '{ print $1 }' | sort) | awk '{ print $1 }')
    echo "${hash}  ${filename}/"

    if [ -n "$1" ]; then
        cd - > /dev/null
    fi
}

crc32dir () {
    hashdir_helper "crc32" "$1"
}

md5dir () {
    hashdir_helper "md5sum" "$1"
}

sha1dir () {
    hashdir_helper "sha1sum" "$1"
}

sha224dir () {
    hashdir_helper "sha224sum" "$1"
}

sha256dir () {
    hashdir_helper "sha256sum" "$1"
}

sha384dir () {
    hashdir_helper "sha384sum" "$1"
}

sha512dir () {
    hashdir_helper "sha512sum" "$1"
}

uninstall () {
    sudo apt purge "$@" && sudo apt autoremove
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

# This bin folder will be for scripts that are not mine... Such as git-radar
export PATH=$dotfiles/.bin:$PATH
# Add my scripts to the path
export PATH=$PATH:$HOME/.my-scripts
# This bin folder is for go scripts I have downloaded/installed
export PATH=$PATH:$HOME/go/bin
# Snaps
export PATH=$PATH:/snap/bin
# App Images
export PATH=$PATH:$HOME/appimages/bin

export PATH=$PATH:$HOME/.config/composer/vendor/bin

export DENO_INSTALL="/home/steven/.deno"
export PATH="$PATH:$DENO_INSTALL/bin"

function timer_start {
    timer=${timer:-$SECONDS}
}

function timer_stop {
    timer_show=$(($SECONDS - $timer))
    if [ "$timer_show" -lt "60" ]; then
        timer_show="${timer_show}s"
    else
        seconds=$((timer_show%60))
        minutes=$((timer_show/60))
        timer_show="${minutes}m${seconds}s"
    fi
    unset timer
}

PROMPT_COMMAND="__prompt_command;"
trap 'timer_start' DEBUG

__prompt_command() {
    ## Get the exit code of the last command that was run
    exit="$?"
    PS1=""
    timer_stop

    # All Colours I used are from the gruvbox pallet -- .vim/plugged/gruvbox/colors/
    # find colour codes here: # http://misc.flogisoft.com/bash/tip_colors_and_formatting
    # Colour Codes
    # NOTE: the background colour of the terminal is #282828
    #       the text colour of the terminal is #AAAAAA (not part of gruvbox)
    #       the font of the terminal is "DejaVu Sans Mono"
    #       the font size of the terminal is 9
    red="\[\e[38;5;167m\]"    # Hex = d75f5f
    blue="\[\e[38;5;109m\]"   # Hex = 87afaf
    yellow="\[\e[38;5;142m\]" # Hex = afaf00
    end_colour="\[\e[m\]"

    PS1="${red}${debian_chroot:+($debian_chroot)}\u@\h"
    # Add Time stamp to bash prompt
    if [[ $OS != "Windows" ]]; then
        # Don't get the date if we are running windows. The date function does not
        # seem to work
        export PS1="$PS1 ${red}[\$(date +%r)]"
    fi

    PS1+=" ${blue}[${timer_show}] "
    PS1+="RET=${exit}${end_colour}"

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

    export PS1+="\$(go-git-radar fetch)"
    # export PS1+="\$(git-radar --bash --fetch)"
    ## Add this line to easily switch to my local fork for checking changes
    # export PS1="$PS1\$(/home/steven/Documents/git-repos/repos-i-contribute-to/git-radar/git-radar --bash --fetch) "

    # This is a command to check if we have sudo privileges currently
    sudo -n true > /dev/null 2>&1
    is_root=$?
    ## If we are root or we have sudo privileges then let us know
    if [[ $USER == "root" ]]; then
        SHELL_TITLE="ROOT SHELL"
        if [ -n "${CUSTOM_TITLE}" ]; then
            SHELL_TITLE="$SHELL_TITLE - $CUSTOM_TITLE"
        fi
        export PS1+="${red}ROOT SHELL${end_colour} $ "
    elif [[ $is_root == 0 ]]; then
        SHELL_TITLE="ELEVATED PRIVILEGES"
        if [ -n "${CUSTOM_TITLE}" ]; then
            SHELL_TITLE="$SHELL_TITLE - $CUSTOM_TITLE"
        fi
        export PS1+="${red}ELEVATED PRIVILEGES${end_colour} $ "
    else
        SHELL_TITLE="Terminal"
        if [ -n "${CUSTOM_TITLE}" ]; then
            SHELL_TITLE="$CUSTOM_TITLE"
        fi
        export PS1+="$ "
    fi

    echo -ne "\033]0;${SHELL_TITLE}\007"
}

## Some Defaults
export EDITOR="/usr/bin/nvim"
export editor="/usr/bin/nvim"
### As far as I know this isn't used for anything by default, but I will use it
### for my own stuff including my "git open" alias. Whenever I used the commands
### that are supposed to open my default browser it always opens up chrome
### instead for some reason, so this is my way of getting around it.
export BROWSER="/usr/bin/brave-browser"
export browser="/usr/bin/brave-browser"

export NVM_DIR="/home/steven/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# Setup the ls colours
# format is 38;5;<foreground colour>;48;5;<background color>
# the 38;5 and 48;5 signify 256 bit colours
# Use this to find colour numbers: https://jonasjacek.github.io/colors/
LS_COLORS=$LS_COLORS:'di=38;5;142:' # Directory
LS_COLORS=$LS_COLORS:'ow=38;5;142:' # Other-Writable dir
LS_COLORS=$LS_COLORS:'ln=38;5;109:' # Symlinks
LS_COLORS=$LS_COLORS:'or=38;5;208:' # Orphan (symlink to nowhere)
LS_COLORS=$LS_COLORS:'ex=38;5;167:' # Executable
LS_COLORS=$LS_COLORS:'fi=38;5;229:' # File
# no  -> Anything not covered by something else (default)
# pi  -> Named Pipe
# do  -> Door
# bd  -> Block device
# cd  -> Character device
# so  -> Socket
# su  -> File that is setuid (u+s)
# sg  -> File that is setgid (g+s)
# tw  -> Directory that is sticky and other-writable (+t,o+w)
# st  -> Directory with the sticky bit set (+t) and not other-writable
# *.extension  -> Every file using this extension e.g. *.jpg
export LS_COLORS

export GOPATH="$HOME/go"

kill_process_match() {
    pid=$(ps aux | awk -v input="${*}" '
        BEGIN {
            # The number of times that we get a matching line
            count = 0;
            # The PID that we care about
            pid = "tmp"
            # Split up all the function args
            split(input, inputs, " ");
        }

        $0 !~ /awk/ {
            for (i in inputs) {
                if ($0 !~ inputs[i]) {
                    next;
                }
            }
            # If we have multiple PIDs that match, then we need to quit
            if (count > 0) {
                exited=1;
                exit 1;
            };
            # Assign the current PID to our PID variable
            pid=$2;
            ## Increment the counter. We should never execute this again.
            count++;
        }

        END {
            # if our we exited before, then print an error message and quit
            if (exited) {
                print "More than one process matches.";
                exit 1;
            }
            if (count <= 0) {
                print "No matches found.";
                exit 1;
            }
            # If no problems, print the PID
            print pid;
        }
    ')

    if [[ $pid =~ ^[0-9]+$ ]]; then
        kill -9 ${pid}
        if [ $? -ne 0 ]; then
            echo "Failed to kill process."
        else
            echo "Process ${pid} killed."
        fi
    else
        echo "Error ${pid}"
    fi
}

# From a directory, get a random file within that directory and subdirectories.
# Usually used to find a random episode of a show for example
randomTVShowEpisode() { randomTVShowEpisode.php "${@}"; }


source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# At present, batcat doesn't have the gruvbox theme in the version that is in
# the ubuntu repos. It is however on their github page
# v0.18.0 uses gruvbox-dark
# v0.16.0 uses gruvbox
# Currently I have v0.12.1
export BAT_THEME=gruvbox-dark
