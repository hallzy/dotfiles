#Dotfiles

  This is a repo of the dot files that I use and have modifications for.

###.vim and .vimrc
  This includes my .vimrc file which is a slightly modified version of the .vimrc
file from [mscoutermarsh](https://github.com/mscoutermarsh)

  Currently the only change is the colour scheme, which is badwolf. This can be
found in homefolder/.vim/colors of this repo.

  I also recommend remapping the caps lock key to esc, since the escape key is
used quite frequently using vim, or remembering that ctrl+\[ is is recognized
as the escape key (this may be a better option for virtual machines, or windows
users as remapping keys in windows or with a vm is a little annoying. Remapping
keys in Ubuntu for example, is much easier).

###.bashrc
  Currently, my .bashrc file is just the default with ubuntu but modified so that
the shell prompt does not show the cwd. To see the cwd use the command pwd.

###.myscripts/
  This holds some scripts I have. The Update script is used by the script in the
.gnome2/ directory.

###.gnome2/
  This holds my nautilus scripts, which are scripts that populate the right
click context menu.
  * Update updates my Ubuntu system as the Update manager does, but in terminal.
  * Open Terminal Here: Opens a terminal with the cwd as the place in the file
    system that you right clicked. ie) if you right click on the desktop and run
this script, it will start a terminal at ~/Desktop/

###.gitconfig
  My .gitconfig file that has some settings such as aliases, and default editor
for commits.

###Usage
  To use these just copy the stuff that you want to the corresponding folder in
your ~/ directory.

  To use everything, just copy all the the files and directories to your ~/
Direcctory.

#Preinstalled vim Plugins
This .vim directory has preinstalled vim plugins. These plugins include:
  * [tComment](http://github.com/vim-scripts/tComment)
  * [NERDTree](https://github.com/scrooloose/nerdtree)
  * [Snipmate](https://github.com/msanders/snipmate.vim)
