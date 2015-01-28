#Dotfiles

This is a repo of the dot files that I use and have modifications for.

###.vim and .vimrc
This includes my .vimrc file which is a slightly modified version of the .vimrc
file from https://github.com/mscoutermarsh

Currently the only change is the colour scheme, which is badwolf. This can be
found in homefolder/.vim/colors of this repo.

###.bashrc
Currently, my .bashrc file is just the default with ubuntu but modified so that
the shell prompt does not show the cwd. To see the cwd use the command pwd.

##.myscripts/
These are scripts that I have that show up in the right click context menu. The
only one in it right now is update which does the same thing as the gui Update
Manager in Ubuntu, but in the terminal.

###Usage
To use any of these, just go copy the files into the corresponding folders of
your ~/ directory.

To use everything, just copy all the contents of homefolder to ~/ or run the
./copy_to_home bash script.

copy-from-home-to-here is a script that I use to copy these files from my ~/
directory to this repo so that I can easily push changes to github.
