alias cp='cpmv cp'
alias mv='cpmv mv'
alias vm='cpmv mv'

alias vim='nvim'
alias vi='nvim'
alias vimdiff='nvim -d'

# some more ls aliases
alias ls='ls -Fh --color'
alias lal='ls -hAlF'
alias la='ls -AF'
alias l='ls'
alias l.='ls -d .*'
alias ll.='ls -ld .*'

# Spelling Mistakes
alias sl='ls'

alias gti='git'
alias got='git'
alias gitst='git st'

# Alias definitions.
alias ll='ls -hlF'

# Give me a grep with 5 lines of context and line numbers
alias grepcontext='grep -nC 5'

#Find a file by name that is below the cwd
alias findcwd='find ./ -name'

# Trash Commands
alias trash='gvfs-trash'
alias show-trash='gvfs-ls trash://'
alias trash-ls='gvfs-ls trash://'

# If the directory exists, don't give an error, and don't create a new empty
# folder
alias mkdir='mkdir -p'

#tlf is tail that auto updates
alias tlf='tail -f'

alias grep_mac='grep "[[:xdigit:]]\{2\}\(:[[:xdigit:]]\{2\}\)\{5\}"'
alias grep_ip='grep "[[:digit:]]\{1,3\}\(\.[[:digit:]]\{1,3\}\)\{3\}"'

# Make rm verbose
alias rm='rm -v'

alias ev='vim $dotfiles/.vimrc'
alias egc='vim $dotfiles/.gitconfig'
alias eba='vim $dotfiles/.bash_aliases'
alias ebr='vim $dotfiles/.bashrc'
alias esxiv='vim $dotfiles/.config/sxiv/exec/key-handler'
alias vim-update-help-tags='vim --cmd "helptags ~/.vim/doc/" --cmd "q!"'
alias update-thefuck='sudo -H pip install thefuck --upgrade'

alias vim-others='vim -u $dotfiles/.vimrc-others'

# Detox Aliases
alias detox-mine='detox --special --remove-trailing -v -s utf_8 -s lower'
alias detox-mine-dry='detox --special --remove-trailing -v -n -s utf_8 -s lower'

alias get-public-ip='wget http://ipinfo.io/ip -qO -'

# Force tmux with 256 colour, otherwise vim is messed up.
alias tmux='tmux -2'

# Unzips any type of tar file.
alias untar='tar xvf'

alias tarcompress='tar cvzf'

# Run mpv with hardware acceleration
alias mpvgpu='mpv --hwdec=auto'

c() {
    local dest="$1"
    shift 1

    # Not all of these use destination names. However, we still require it so
    # that we know what program to use

    case "$dest" in
        *.tar.bz2)   tar cvpjf  "$dest" "$@" ;;
        *.tbz2)      tar cvpjf  "$dest" "$@" ;;
        *.tar.gz)    tar cvpzf  "$dest" "$@" ;;
        *.tgz)       tar cvpzf  "$dest" "$@" ;;
        *.tar.xz)    tar cvpf   "$dest" "$@" ;;
        *.tar)       tar cvpf   "$dest" "$@" ;;
        *.bz2)       bzip2 -zkv "$@"         ;;
        *.rar)       rar a      "$dest" "$@" ;;
        *.gz)        gzip -kv   "$@"         ;;
        *.zip)       zip        "$dest" "$@" ;;
        *.crx)       zip        "$dest" "$@" ;;
        *.7z)        7z a       "$dest" "$@" ;;
        *)           echo "Unable to create archive '$dest'" ;;
    esac
}

x(){
    while [ -n "$1" ]; do
        if [ -f "$1" ] ; then
            case "$1" in
                *.tar.bz2)   tar xvjf "$1"    ;;
                *.tar.gz)    tar xvzf "$1"    ;;
                *.tar.xz)    tar xvf "$1"     ;;
                *.bz2)       bunzip2 "$1"     ;;
                *.rar)       unrar x "$1"     ;;
                *.gz)        gunzip "$1"      ;;
                *.tar)       tar xvf "$1"     ;;
                *.tbz2)      tar xvjf "$1"    ;;
                *.tgz)       tar xvzf "$1"    ;;
                *.zip)       unzip "$1"       ;;
                *.crx)       unzip "$1"       ;;
                *.Z)         uncompress "$1"  ;;
                *.7z)        7z x "$1"        ;;
                *)           echo "Unable to extract '$1'" ;;
            esac
        else
            echo "'$1' is not a valid file"
        fi
        shift
    done
}

# source bashrc and bash_alias
alias sbr='source ~/.bashrc'
alias sba='source ~/.bash_aliases'

alias reallykill='kill -9'

# Show me disk info, like space that is left and disk capacity
alias diskspace='df -kh .'

# Get disk usage for the current Directory and sub folders
alias diskusage="du -sh ./"

memory_usage() {
    system_mem=$(grep "^MemTotal" /proc/meminfo | awk '{print $2/1024}')
    ps axv | awk -v input="${*}" -v mem="$system_mem" '
        BEGIN {
            split(input, inputs, " ")
        }
        {
            for (i in inputs) {
                if ( $0 !~ inputs[i] ) {
                    next
                }
            }
            s += $9;
        }
        END {
            print "Memory Usage: "s*0.01*mem" MB ("s"%) (Total: "mem")";
        }
    '
}

cpu_usage() {
    ps aux | awk -v input="${*}" '
        BEGIN {
            split(input, inputs, " ")
        }
        {
            for (i in inputs) {
                if ( $0 !~ inputs[i] ) {
                    next
                }
            }
            s += $3;
        }
        END {
            print "CPU Usage: "s"%";
        }
    '
}

usage() {
    memory_usage "$@"
    cpu_usage "$@"
}

alias localserver="python -m SimpleHTTPServer"

alias restart-wifi="sudo service network-manager restart"

alias ubc-tunnel="ssh -D1337 -L1706:service:1706 -L1711:service:1711 -X f4y8@ssh.ece.ubc.ca"

# this installs the package that is recommended to you in the previous command
# output. For example: entering the command "sl" without having it installed
# would result in the following output:
################################################################################
# The program 'sl' is currently not installed. You can install it by typing:
# sudo apt install sl
################################################################################
# executing this alias would then install sl using the second line of that
# previous output
alias i='$($(history | tail -2 | head -1 | cut -d" " -f4-) 2>&1 > /dev/null | tail -1)'

alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'

# Open up the backup program as root so that I can make sure everything is
# backing up
alias backup='gksu deja-dup-preferences'

alias trim='sudo fstrim -v --all'

# Shows the DNS Servers this computer uses
alias dns_servers='nmcli device show wlp2s0 | grep IP4.DNS | grep_ip -o'

largest() {
    find . -type f -exec du -sh "{}" \; | sort -hr | head -"${1:-1}"
}

alias random_dir='/bin/ls -1 | head -$((($RANDOM % $(/bin/ls -1 | wc -l)) + 1)) | tail -1'

weather() {
    curl "http://wttr.in/${1}"
}

dict() {
    curl "dict://dict.org/d:${1}" 2> /dev/null | /bin/grep -v "^[0-9]"
}


video_to_images() {
    local vid;
    local vidpath;
    local vidname;
    local imageCount;

    if [[ ! -f "$1" || ! "$2" =~ ^[0-9]*$ ]]; then
        echo "Expected a filename. Images per second defaults to 1 image per frame if not included.";
        echo "Usage: $0 <video file path> <images per second>"
        return 1
    fi

    vid="$1"
    imageCount="$2"

    vidpath="$(dirname "$vid")"

    vidname=$(basename -- "$vid")
    vidname="${vidname%.*}"

    if [ -z "$imageCount" ]; then
        imageCount="$(exiftool "$vid" | awk -F' +: +' '$0 ~ "^Video Frame Rate" { printf("%.0f\n", $2); }')"
    fi

    ffmpeg -i "$vid" -vf fps=$imageCount "${vidpath}/${vidname}%04d.png"
}

# Sometimes images come as small sections of a bigger image. This will take them
# in alpha order and combine them into 1 large image given the number of columns
# that this image is
buildImageMontage() {
    # I expect first argument to be the number of columns the image is, and the
    # rest are the images to be used. Since this command is used to combine
    # images, I would expect no less than 2 images. So a minimum of 3 arguments
    # is required.
    if [ $# -lt 4 ]; then
        echo "Usage:"
        echo "  buildImageMontage number-of-columns output-file file1 file2 [...fileN]"
        return 1
    fi

    if ! [[ "$1" =~ ^[0-9]+$ ]] || [ $1 -le 0 ]; then
        echo "Usage:"
        echo "  buildImageMontage number-of-columns file1 file2 [...fileN]"
        echo ""
        echo "  number-of-columns must be an integer greater than 0."
        return 1
    fi

    local numberOfCols=$1
    local out="$2"
    shift 2

    if [ -f "$out" ]; then
        echo "Output file '$out' already exists. Aborting.";
        return 1;
    fi

    montage "$@" -tile "$numberOfCols" -geometry +0+0 "$out"
}
