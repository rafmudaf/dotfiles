
# My dotfiles

This repository contains some of the configuration files for my computers.
These are usually Bash configurations and typically located in the home directory.

**WARNING:** Feel free to use any of these, but be aware that they are tailored to my needs
and may not work for you. Also, my name and email address are in some of these files, so
be sure to read through them all to configure your information properly.

| File name | Configuration Type | Location |  Description |
|-----------|--------------------|----------|--------------|
| `nrel.profile` | Bash | `~/.nrel.profile` | Bash configuration file for my NREL computers; sourced by `.bashrc` |
| `eagle.profile` | Bash | `~/.eagle.profile` | Bash configuration for my account on NREL's Eagle supercomputer; sourced by `.bashrc` |
| `kestrel.profile` | Bash | `~/.kestrel.profile` | Bash configuration for my account on NREL's Kestrel supercomputer; sourced by `.bashrc` |
| `ubuntu.profile` | Bash | `~/.ubuntu.profile` | Bash configuration for a few Linux computers that I've used in the past; sourced by `.bashrc` |
| `raf.profile` | Bash | `~/.raf.profile` | Bash configuration for my personal computer; sourced by `.bashrc` |
| `common.bash` | Bash | `~/.common.bash` | Bash configurations that are common across all systems; this is sourced by a `.profile` |
| `colors.bash` | Bash | `~/.colors.bash` | Creates colors for use in the PS1 environment variable and to configure the terminal text; this is sourced by a `.profile` |
| `gitconfig` | git | `~/.gitconfig` | Configuration for git |

## Installation

A simple installation script is provided at `install.bash`.
It includes a configuration section at the top to specify some basic options and
locations on your file system.
Then, it creates symbolic links in your home directory to the configuration files
in this repository.

**Note:** After running this installation script, create a new terminal session to
see the changes take effect.
