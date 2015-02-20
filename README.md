#Dotfiles

  This is a repo of the dot files that I use and have modifications for.

###.vim and .vimrc
  This includes my .vimrc file which is a slightly modified version of the .vimrc
file from [mscoutermarsh](https://github.com/mscoutermarsh)

  Currently the only change is the colour scheme, which is badwolf. This can be
found in .vim/colors of this repo.

  I also recommend remapping the caps lock key to esc, since the escape key is
used quite frequently using vim, or remembering that ctrl+\[ is is recognized
as the escape key (this may be a better option for virtual machines, or windows
users as remapping keys in windows or with a vm is a little annoying. Remapping
keys in Ubuntu for example, is much easier).

  Using git-time-lapse is toggled by clicking the F7 key. This can be changed in
the .vimrc file.

###.bashrc
  Currently, my .bashrc file is just the default with ubuntu but modified so that
the shell prompt does not show the cwd. To see the cwd use the command pwd.

  It also has some extra aliases for different directory listings.

###.myscripts/
  This holds some scripts I have. The Update script is used by the script in the
.gnome2/ directory.

  It also has _open-nautilus_ which, when executed from the terminal, opens the
nautilus file manager at the current location in the terminal.

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

  To use everything, just copy all of the files and directories to your ~/
directory.

``
$ cd ~

$ git clone https://github.com/hallzy/dotfiles.git
``

#Preinstalled vim Plugins
This .vim directory has preinstalled vim plugins. These plugins include:
  * [tComment](http://github.com/vim-scripts/tComment)
  * [NERDTree](https://github.com/scrooloose/nerdtree)
  * [Snipmate](https://github.com/msanders/snipmate.vim)
  * [a.vim](https://github.com/vim-scripts/a.vim)
  * [git-time-lapse](https://github.com/vim-scripts/git-time-lapse)
