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

alias cp='dbus-launch gcp'

alias grep_mac='grep "[0-9a-fA-F]\{2\}\(:[0-9a-fA-F]\{2\}\)\{5\}"'
alias grep_ip='grep "[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}"'

# Make rm verbose
alias rm='rm -v'

alias ev='vim $HOME/.vimrc'
alias egc='vim $HOME/.gitconfig'
