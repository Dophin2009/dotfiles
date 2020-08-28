# dotfiles

The dotfiles for my Linux machines, managed by a custom Makefile
solution similar to GNU Stow.

Each subdirectory is a configuration 'package'. The Makefile contains
targets to link each package to its proper location. Some packages
depend on others, and those dependencies are specified as target
prerequisites.

A set of base packages are linked for every non-base package. See [Base
Packages](#base-packages).

[`dotprofile`](https://github.com/Dophin2009/dotprofile) is used to
template some configuration files and manage themes.

- [Installation](#installation)
- [Base Packages](#base-packages)
- [CLI Packages](#cli-packages)
- [GUI Packages](#gui-packages)
- [Distro Packages](#distro-packages)

## Installation

Clone this repo somewhere (e.g. `~/.dotfiles`).

Link the desired packages with `make <package>`.

## Base Packages

The following are considered `base` packages. These are linked as
dependencies for every other package.

| Name        | Dependencies                                             | Usage / Description                                            | Customization                                                                                                       |
| ----------- | -------------------------------------------------------- | -------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| dotprofile  | [`dotprofile`](https://github.com/Dophin2009/dotprofile) | Configurations and profiles for templated configuration files. | `.config/dotprofile/local.yaml` should be created with local variables under `local`. See dependents for variables. |
| `sh`        |                                                          | Shared shell configurations for POSIX shells.                  |                                                                                                                     |
| `user-dirs` |                                                          | Default file directory configuration.                          |                                                                                                                     |

## Dev Packages

| Name      | Package Dep. | Application / Dependencies                                                          | Usage / Description                                                                                               | Customization                                                                           |
| --------- | ------------ | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| `android` |              | `android`                                                                           | Sets `ANDROID_SDK_HOME` to use XDG data.                                                                          |                                                                                         |
| `cargo`   |              | [`cargo`](https://github.com/rust-lang/cargo)                                       | Sets `CARGO_HOME` to use XDG data.                                                                                |                                                                                         |
| `docker`  |              | [`docker`](https://www.docker.com/)                                                 | Sets `DOCKER_CONFIG` to use XDG config.                                                                           |                                                                                         |
| `dotnet`  |              | [`dotnet`](https://dotnet.microsoft.com/)                                           | Sets `DOTNET_CLI_TELEMETRY_OPTOUT` to true.                                                                       |                                                                                         |
| `ghcup`   |              | [`ghcup`](https://gitlab.haskell.org/haskell/ghcup-hs)                              | Sets `GHCUP_INSTALL_BASE_PREFIX` to use XDG data.                                                                 |                                                                                         |
| `git`     |              | [`git`](https://git-scm.com/); (optional: [`fzf`](https://github.com/junegunn/fzf)) | Minimal git configuration file + git aliases (`gcmsg`, `gl`, `gp`, etc). The alias `gdiff` requires `fzf`.        | `.config/git/config.local` should be created with credentials under `[user]` if needed. |
| `gradle`  |              | [`gradle`](https://gradle.org/)                                                     | Sets `GRADLE_USER_HOME` to use XDG data.                                                                          |                                                                                         |
| `java`    |              | [`java`](https://www.java.com/)                                                     | Sets `_JAVA_OPTIONS` to set prefs root to XDG config.                                                             |                                                                                         |
| `maven`   |              | [`maven`](https://maven.apache.org/)                                                | Aliases mvn to always use configuration file at XDG config.                                                       |                                                                                         |
| `mysql`   |              | [`mysql`](https://www.mysql.com/)                                                   | XDG env fix: `MYSQL_HISTFILE` to use XDG data.                                                                    |                                                                                         |
| `npm`     |              | [`npm`](https://github.com/npm/cli)                                                 | Directs `npm` to use `npmrc` in XDG config.                                                                       |                                                                                         |
| `nuget`   |              | [`nuget`](https://www.nuget.org/)                                                   | Sets `NUGET_PACKAGES` to use XDG cache.                                                                           |                                                                                         |
| `nvm`     |              | [`nvm`](https://github.com/nvm-sh/nvm)                                              | Sets `NVM_DIR` to XDG data.                                                                                       |                                                                                         |
| `pgsql`   |              | [PostgreSQL](https://www.postgresql.org/)                                           | Sets `PSQLRC`, `PGPASSFILE`, `PGSERVICEFILE` to use XDG config and `PSQL_HISTORY` to use XDG cache.               |                                                                                         |
| `pylint`  |              | [`pylint`](https://github.com/PyCQA/pylint)                                         | Sets `PYLINTHOME` to XDG cache.                                                                                   |                                                                                         |
| `python`  |              | [`python`](https://www.python.org/)                                                 | Sets `PYTHON_EGG_CACHE` to use XDG cache.                                                                         |                                                                                         |
| `R`       |              | [`R`](https://www.r-project.org/)                                                   | Minimal XDG compliance and convenience `Rprofile` file.                                                           |                                                                                         |
| `ruby`    |              | [`bundle`](https://bundler.io/), [`gem`](https://rubygems.org/)                     | Sets `GEM_HOME`, `GEM_SPEC_CACHE`, `BUNDLE_USER_CONFIG`, `BUNDLE_USER_CACHE`, `BUNDLE_USER_PLUGIN` to follow XDG. |                                                                                         |
| `rustup`  |              | [`rustup`](https://github.com/rust-lang/rustup)                                     | Sets `RUSTUP_HOME` to XDG data.                                                                                   |                                                                                         |
| `stack`   |              | [`stack`](https://github.com/commercialhaskell/stack)                               | Sets `STACK_ROOT` to XDG data.                                                                                    |                                                                                         |
| `texlive` |              | [TeX Live](http://tug.org/texlive/)                                                 | Adds a TeX Live full install profile to `.config/texlive`.                                                        |                                                                                         |

## CLI Packages

| Name       | Package Dep. | Dependencies                                                                                           | Usage / Description                                                                            | Customization                                    |
| ---------- | ------------ | ------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------- | ------------------------------------------------ |
| `dicth`    |              | [`dictd`](https://sourceforge.net/projects/dict/), [`aiksaurus`](https://github.com/AbiWord/aiksaurus) | Adds aliases `def` and `th` to query a `dictd` server with WordNet dictionary and `aiksaurus`. |                                                  |
| `newsboat` |              | [`newsboat`](https://github.com/newsboat/newsboat)                                                     | Minimal newsboat configuration file.                                                           | Populate `.config/newsboat/urls` with feed urls. |

## GUI Packages

| Name        | Package Dep.             | Dependencies                                           | Usage / Description                                                                                     | Customization |
| ----------- | ------------------------ | ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------- | ------------- |
| `alacritty` | `dotprofile`, `terminfo` | [`alacritty`](https://github.com/alacritty/alacritty)  | Templated configuration that uses profile colors and font.                                              |               |
| `mpdnotify` | `mpd`                    | [`mpdnotify`](https://github.com/Dophin2009/mpdnotify) | MPD notication daemon. Adds a user systemd service that requires `mpdnotify` to be in `/usr/local/bin`. |               |

## Distro Packages

These are packages for specific distros.

| Name     | Distro       | Dependencies                                                   | Usage / Description                                                          | Customization |
| -------- | ------------ | -------------------------------------------------------------- | ---------------------------------------------------------------------------- | ------------- |
| `pacman` | pacman-based | `pacman`; (optional: [`fzf`](https://github.com/junegunn/fzf)) | Adds the alias `pacman-browse-pkgs` to browse installed packages with `fzf`. |               |
