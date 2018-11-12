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


if which gcp > /dev/null 2>&1; then
  alias cp='dbus-launch gcp'
fi

alias grep_mac='grep "[[:xdigit:]]\{2\}\(:[[:xdigit:]]\{2\}\)\{5\}"'
alias grep_ip='grep "[[:digit:]]\{1,3\}\(\.[[:digit:]]\{1,3\}\)\{3\}"'

# Make rm verbose
alias rm='rm -v'

alias ev='vim $dotfiles/.vimrc'
alias egc='vim $dotfiles/.gitconfig'
alias eba='vim $dotfiles/.bash_aliases'
alias ebr='vim $dotfiles/.bashrc'
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
