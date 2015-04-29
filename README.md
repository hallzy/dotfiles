#Dotfiles

![C++ File](./.screenshots/c++.png)

![C++ File with Nerdtree](./.screenshots/c++_w_nerdtree.png)

  This is a repo of the dot files that I use and have modifications for.

###Usage
  To use everything in this repo, just run the following command:

####Initial Setup

```bash
$ cd ~
$ git clone https://github.com/hallzy/dotfiles.git
$ ./move-files-from-dotfiles-to-home
$ ./create-sym-links-for-myscripts
$ .auto-install-programs/install-programs
```

This will clone the repository to your home folder. All the files in this repo
will be put into a folder called dotfiles which is in the home folder. The
script that runs as the 3rd step above moves all the files and folders from the
dotfiles folder and into the home folder, and then removes the dotfiles folder
for you. The last step runs a script that creates symbolic links in your /bin
folder for scripts that are in ~/.my-scripts.

The second last entry will install all the programs in the
.auto-install-programs/programs-to-install file.

The last entry will install a program called
[thefuck](https://github.com/nvbn/thefuck.git).

####Update Your Local Repo

```bash
$ cd ~
$ git pull origin master
$ ./create-sym-links-for-myscripts
$ .auto-install-programs/install-programs
```

This will pull the latest change from the repo and create symbolic links for any
new scripts that have been added to ~/.my-scripts, and will also install updates
for the programs in the to be installed list, and install newly added programs.


###.vim and .vimrc
  This includes my .vimrc file which is  modified version of the .vimrc
file from [mscoutermarsh](https://github.com/mscoutermarsh)

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

### .bash_aliases
  Has my aliases which include the use of the trashbin:

```bash
$ trash
$ trash-ls
$ trash-restore
```

You can:

1. Move a file to the trash bin.
2. View the contents of the trash bin.
3. restore files to there original location from the trash bin

respectively. The first two are aliases in the .bashrc, the 3rd one is a script
in the .my-scripts directory which I moved to my /bin.

###.myscripts/
  This holds some scripts I have. The Update script is used by the script in the
.gnome2/ directory.

  It also has _open-nautilus_ which, when executed from the terminal, opens the
nautilus file manager at the current location in the terminal.

  trash-restore restores a given file back to its original location after it has
been moved to the trash.

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

###.auto-install-programs
  This folder contains bash scripts that will automatically install all the
programs specified in the programs-to-install file. To use this:

```bash
$ cd ~/.auto-install-programs
$ ./install-programs
```

  Assuming that your list of programs to install is up to date. If you do not
already have a log folder within this folder, it will create one for you, and
create timestamped logs within this folder.

  This script will use the helper script to help make it run as intended. It
will automatically run

```bash
$ sudo add-apt-repository <repo>
```

```bash
$ sudo apt-get update
```

and

```bash
$ sudo apt-get <program>
```

where \<program\> is every program listed in the programs-to-install file. A
summary will be shown at the end saying which of the scripts had successfully
been installed, and which scripts did not.

The script automatically enters a "y" for you when apt-get prompts you to see if
you want to install something.

There is also an option to get the script to email you when it is finished...

```bash
$ ./install-programs --email me@email.com
```

Note that mailutils needs to be installed to do this. It is part of the
programs-to-install file, but it will not be used if it was not already
installed beforehand.

There are 3 files that hold programs or repos to install.

  * programs-to-install-require-user-interaction
  * programs-to-install
  * repos-to-add

The first holds all the programs that require extra user input upon install.
These programs are installed first so that you are able to leave the script
running after they are installed. The script will pause and let you know that
this section of the script is done.

The second is all the regular programs that can be installed without user input.

The last are a list of repositories that you may want added.

There is also a section at the bottom of install-programs-helper for programs
that need a more specific installation.

#Preinstalled vim Plugins
This .vim directory has preinstalled vim plugins. These plugins include:
  * [tComment](http://github.com/vim-scripts/tComment)
  * [NERDTree](https://github.com/scrooloose/nerdtree)
  * [Snipmate](https://github.com/msanders/snipmate.vim)
  * [a.vim](https://github.com/vim-scripts/a.vim)
  * [git-time-lapse](https://github.com/vim-scripts/git-time-lapse)
  * [easy-motion](https://github.com/Lokaltog/vim-easymotion)
  * [fugitive](https://github.com/tpope/vim-fugitive)
  * [powerline](https://github.com/Lokaltog/vim-powerline)

Notes:

My leader is the spacebar.

My easy motion \<leader\> is \<leader\>/

This can be changed within the vimrc file.
