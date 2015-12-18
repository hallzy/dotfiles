# some more ls aliases
alias lal='ls -hAl'
alias la='ls -A'
alias l='ls'
alias sl='ls'

# Alias definitions.
alias ll='ls -hl'

# Give me a grep with 5 lines of context and line numbers
alias grepcontext='grep -nC 5'

#Find a file by name that is below the cwd
alias findcwd='find ./ -name'

# Trash Commands
alias trash='gvfs-trash'
alias show-trash='gvfs-ls trash://'
alias trash-ls='gvfs-ls trash://'

# If the directory exists, dont give an error, and dont create a new empty
# folder
alias mkdir='mkdir -p'

#tlf is tail that auto updates
alias tlf='tail -f'

isGcpInstalled=$(which gcp)

if [[ "$isGcpInstalled" != "" ]]; then
  alias cp='dbus-launch gcp'
fi

alias grep_mac='grep "[0-9a-fA-F]\{2\}\(:[0-9a-fA-F]\{2\}\)\{5\}"'
alias grep_ip='grep "[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}"'

# Make rm verbose
alias rm='rm -v'

alias ev='vim $dotfiles/.vimrc'
alias egc='vim $dotfiles/.gitconfig'
alias eba='vim $dotfiles/.bash_aliases'
alias ebr='vim $dotfiles/.bashrc'
alias vim-update-help-tags='vim --cmd "helptags ~/.vim/doc/" --cmd "q!"'

# Detox Aliases
alias detox-mine='detox --special --remove-trailing -v -s utf_8 -s lower'
alias detox-mine-dry='detox --special --remove-trailing -v -n -s utf_8 -s lower'

alias get-public-ip='wget http://ipinfo.io/ip -qO -'
