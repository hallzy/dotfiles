# some more ls aliases
alias ls='ls -F --color'
alias lal='ls -hAlF'
alias la='ls -AF'
alias l='ls'

# Spelling Mistakes
alias sl='ls'
alias gti='git'
alias gitst='git st'

# Alias definitions.
alias ll='ls -hlF'

# -I ignores binary files. It tells grep to process them as if there is no
# match.
alias grep='grep -I'

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


if which gcp > /dev/null 2>&1; then
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
alias update-thefuck='sudo -H pip install thefuck --upgrade'
alias install-thefuck='wget -O - https://raw.githubusercontent.com/nvbn/thefuck/master/install.sh | sh - && $0'

# Detox Aliases
alias detox-mine='detox --special --remove-trailing -v -s utf_8 -s lower'
alias detox-mine-dry='detox --special --remove-trailing -v -n -s utf_8 -s lower'

alias get-public-ip='wget http://ipinfo.io/ip -qO -'

# Force tmux with 256 colour, otherwise vim is messed up.
alias tmux='tmux -2'

# Unzips any type of tar file.
alias untar='tar xvf'

# source bashrc and bash_alias
alias sbr='source ~/.bashrc'
alias sba='source ~/.bash_aliases'

alias reallykill='kill -9'

# Show me disk info, like space that is left and disk capacity
alias diskspace='df -kh .'

