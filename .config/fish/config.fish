# Modify the terminal's 256 color palette to use the gruvbox theme
set -l GRUVBOX_SCRIPT ~/.config/fish/gruvbox_256palette.sh
if test -f $GRUVBOX_SCRIPT
    bash $GRUVBOX_SCRIPT
end

fish_vi_mode
