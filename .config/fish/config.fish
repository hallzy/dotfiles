# Modify the terminal's 256 color palette to use the gruvbox theme
# set -l GRUVBOX_SCRIPT ~/.config/fish/gruvbox_256palette.sh
# if test -f $GRUVBOX_SCRIPT
#     bash $GRUVBOX_SCRIPT
# end

fish_vi_mode

# Get the exit code of last run command
set exit_code 0
function get_ret_value --on-event fish_prompt
	set exit_code $status
end

# aliases
alias ef "vim ~/.config/fish"
