# dotfiles

The dotfiles for my Linux machines, managed by a custom Makefile
solution similar to GNU Stow.

Each subdirectory is a configuration 'package'. The Makefile contains
targets to link each package to its proper location. Some packages
depend on others, and those dependencies are specified as target
prerequisites.

A set of base packages are linked for every non-base package. See
[Packages](#packages).

[dotprofile](https://github.com/Dophin2009/dotprofile) is used to
template some configuration files and manage themes.

## Installation

Clone this repo somewhere (e.g. `~/.dotfiles`).

The [bootstrap script](./bootstrap) will link the [base
packages](#packages).

Link the desired packages with `make <package>`.

## Base Packages

The following are considered `base` packages. These are linked as
dependencies for every other package.

-   `user-dirs`
-   `dotprofile`
-   `git`
-   `tmux`
-   `sh`
-   `zsh`

### git

A `config.local` file should be created in `.config/git`.

    [user]
      name = John Doe
      email = johndoe@example.com

## CLI Packages

### dicth

dds the following shell aliases:

-   `def`: `dict -d wn`
-   `th`: `aiksaurus`

Requires [`dictd`](https://sourceforge.net/projects/dict/) and the
[`aiksaurus`](https://github.com/AbiWord/aiksaurus) command line tools.

### newsboat

Populate `.config/newsboat/urls` with feed urls.

## GUI Packages

### mpdnotify

This package requires
[`mpdnotify`](https://github.com/Dophin2009/mpdnotify) to be in
`/usr/local/bin`.

## Distro Packages

These are packages for specific distros.

### Pacman

Adds the alias `pacman-browse-pkgs` to browse installed packages with
`fzf`.
