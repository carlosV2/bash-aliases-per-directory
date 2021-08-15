## Motivation

I use to have multiple projects set up in my machine. As you can expect, each project has its own configuration and requirements. This also includes the commands I need in order to run them.
I find a bit irritating defining aliases for a project that will be available system wide. Also, it's frustrating not being able to use the same alias name for similar but yet not the same aliases on two different projects.

May be there is a better way to do it but here is my solution.

## Solution

I've designed a little hack to enable aliases per directory. Once you have this tool installed, you just need to create a file called `.aliases` with the aliases you want following the format `alias_name alias_content`. For example:
```
cs cd && ls
lc ls -color=auto
ll ls -l
```

This file will automatically enable those aliases for the folder where this file is and all its subfolders.

## Install

1. Clone this repository to your home directory.

```sh
git clone https://github.com/carlosV2/bash-aliases-per-directory.git .bash-aliases-per-directory
```

2. Modify your `~/.bashrc` and add to the end

```sh
# some other config in .bashrc

# Bash Aliases Per Directory

# Source the bash dev tools script
source "$HOME/.bash-aliases-per-directory/run.sh"
```

**Enjoy!**
