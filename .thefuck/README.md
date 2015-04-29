# The Fuck [![Build Status](https://travis-ci.org/nvbn/thefuck.svg)](https://travis-ci.org/nvbn/thefuck)

Magnificent app which corrects your previous console command,
inspired by a [@liamosaur](https://twitter.com/liamosaur/)
[tweet](https://twitter.com/liamosaur/status/506975850596536320).

Few examples:

```bash
➜ apt-get install vim
E: Could not open lock file /var/lib/dpkg/lock - open (13: Permission denied)
E: Unable to lock the administration directory (/var/lib/dpkg/), are you root?

➜ fuck
sudo apt-get install vim
[sudo] password for nvbn:
Reading package lists... Done
...
```

```bash
➜ git push
fatal: The current branch master has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin master


➜ fuck
git push --set-upstream origin master
Counting objects: 9, done.
...
```

```bash
➜ puthon
No command 'puthon' found, did you mean:
 Command 'python' from package 'python-minimal' (main)
 Command 'python' from package 'python3' (main)
zsh: command not found: puthon

➜ fuck
python
Python 3.4.2 (default, Oct  8 2014, 13:08:17)
...
```

```bash
➜ git brnch
git: 'brnch' is not a git command. See 'git --help'.

Did you mean this?
	branch

➜ fuck
git branch
* master
```

```bash
➜ lein rpl
'rpl' is not a task. See 'lein help'.

Did you mean this?
         repl

➜ fuck
lein repl
nREPL server started on port 54848 on host 127.0.0.1 - nrepl://127.0.0.1:54848
REPL-y 0.3.1
...
```

If you are scared to blindly run changed command, there's `require_confirmation`
[settings](#settings) option:

```bash
➜ apt-get install vim
E: Could not open lock file /var/lib/dpkg/lock - open (13: Permission denied)
E: Unable to lock the administration directory (/var/lib/dpkg/), are you root?

➜ fuck
sudo apt-get install vim [Enter/Ctrl+C]
[sudo] password for nvbn:
Reading package lists... Done
...
```

## Requirements

- python (2.7+ or 3.3+)
- pip
- python-dev

## Installation

Install `The Fuck` with `pip`:

```bash
sudo pip install thefuck
```

[Or using an OS package manager (OS X, Ubuntu, Arch).](https://github.com/nvbn/thefuck/wiki/Installation)

And add to `.bashrc` or `.zshrc` or `.bash_profile`(for OSX):

```bash
alias fuck='eval $(thefuck $(fc -ln -1))'
# You can use whatever you want as an alias, like for Mondays:
alias FUCK='fuck'
```

[Or in your shell config (Bash, Zsh, Fish, Powershell).](https://github.com/nvbn/thefuck/wiki/Shell-aliases)

Changes will be available only in a new shell session.


## Update

```bash
sudo pip install thefuck --upgrade
```

## How it works

The Fuck tries to match rule for the previous command, create new command
using matched rule and run it. Rules enabled by default:

* `brew_unknown_command` &ndash; fixes wrong brew commands, for example `brew docto/brew doctor`;
* `cd_parent` &ndash; changes `cd..` to `cd ..`;
* `cd_mkdir` &ndash; creates directories before cd'ing into them;
* `cp_omitting_directory` &ndash; adds `-a` when you `cp` directory;
* `fix_alt_space` &ndash; replaces Alt+Space with Space character;
* `git_no_command` &ndash; fixes wrong git commands like `git brnch`;
* `git_push` &ndash; adds `--set-upstream origin $branch` to previous failed `git push`;
* `has_exists_script` &ndash; prepends `./` when script/binary exists;
* `lein_not_task` &ndash; fixes wrong `lein` tasks like `lein rpl`;
* `mkdir_p` &ndash; adds `-p` when you trying to create directory without parent;
* `no_command` &ndash; fixes wrong console commands, for example `vom/vim`;
* `pip_unknown_command` &ndash; fixes wrong pip commands, for example `pip instatl/pip install`;
* `python_command` &ndash; prepends `python` when you trying to run not executable/without `./` python script;
* `sl_ls` &ndash; changes `sl` to `ls`;
* `rm_dir` &ndash; adds `-rf` when you trying to remove directory;
* `ssh_known_hosts` &ndash; removes host from `known_hosts` on warning;
* `sudo` &ndash; prepends `sudo` to previous command if it failed because of permissions;
* `switch_layout` &ndash; switches command from your local layout to en.

Bundled, but not enabled by default:

* `ls_lah` &ndash; adds -lah to ls;
* `rm_root` &ndash; adds `--no-preserve-root` to `rm -rf /` command.

## Creating your own rules

For adding your own rule you should create `your-rule-name.py`
in `~/.thefuck/rules`. Rule should contain two functions:
`match(command: Command, settings: Settings) -> bool`
and `get_new_command(command: Command, settings: Settings) -> str`.

`Command` has three attributes: `script`, `stdout` and `stderr`.

`Settings` is a special object filled with `~/.thefuck/settings.py` and values from env, [more](#settings).

Simple example of the rule for running script with `sudo`:

```python
def match(command, settings):
    return ('permission denied' in command.stderr.lower()
            or 'EACCES' in command.stderr)


def get_new_command(command, settings):
    return 'sudo {}'.format(command.script)
```

[More examples of rules](https://github.com/nvbn/thefuck/tree/master/thefuck/rules),
[utility functions for rules](https://github.com/nvbn/thefuck/tree/master/thefuck/utils.py).

## Settings

The Fuck has a few settings parameters, they can be changed in `~/.thefuck/settings.py`:

* `rules` &ndash; list of enabled rules, by default `thefuck.conf.DEFAULT_RULES`;
* `require_confirmation` &ndash; require confirmation before running new command, by default `False`;
* `wait_command` &ndash; max amount of time in seconds for getting previous command output;
* `no_colors` &ndash; disable colored output.

Example of `settings.py`:

```python
rules = ['sudo', 'no_command']
require_confirmation = True
wait_command = 10
no_colors = False
```

Or via environment variables:

* `THEFUCK_RULES` &ndash; list of enabled rules, like `DEFAULT_RULES:rm_root` or `sudo:no_command`;
* `THEFUCK_REQUIRE_CONFIRMATION` &ndash; require confirmation before running new command, `true/false`;
* `THEFUCK_WAIT_COMMAND` &ndash; max amount of time in seconds for getting previous command output;
* `THEFUCK_NO_COLORS` &ndash; disable colored output, `true/false`.
 
For example:

```bash
export THEFUCK_RULES='sudo:no_command'
export THEFUCK_REQUIRE_CONFIRMATION='true'
export THEFUCK_WAIT_COMMAND=10
export THEFUCK_NO_COLORS='false'
```

## Developing

Install `The Fuck` for development:

```bash
pip install -r requirements.txt
python setup.py develop
```

Run tests:

```bash
py.test
```

## License MIT
Project License can be found [here](LICENSE.md).
