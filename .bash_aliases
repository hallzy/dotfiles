# some more ls aliases
alias lal='ls -hAl'
alias la='ls -A'
alias l='ls'

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

#chmod and chown now have sudo
alias chmod='sudo chmod'
alias chown='sudo chown'

#tlf is tail that auto updates
alias tlf='tail -f'


alias fuck='eval $(thefuck $(fc -ln -1))'
alias woops='eval $(thefuck $(fc -ln -1))'

