# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Add my scripts to the path
export PATH=$PATH:$HOME/.my-scripts
# This bin folder will be for scripts that are not mine... Such as git-radar
export PATH=$PATH:$dotfiles/.bin
# This bin folder is for go scripts I have downloaded/installed
export PATH=$PATH:$HOME/go/bin

if [ -x '/usr/local/bin/slstatus' ]; then
    slstatus &
fi

# Swap the escape and caps-lock key
setxkbmap -option "caps:swapescape"

# With DWM horizontal two finger scroll doesn't work. Enable it with this
if which synclient > /dev/null 2>&1; then
    synclient HorizTwoFingerScroll=1
fi

# If I am on my work computer and I have 3 monitors connected, setup multiple
# monitors automatically on login
if [ "$(hostname)" = 'stn-dell-xps' -a "$(xrandr | grep " connected" -c)" -eq 3 ]; then
    xrandr --output eDP-1-1 --auto --output DP-1-3 --auto --right-of eDP-1-1 --output DP-1-1  --auto --right-of DP-1-3
fi
