![dotfile logo](https://raw.githubusercontent.com/jglovier/dotfiles-logo/main/dotfiles-logo.svg)

These are my dotfiles.

## Environment

- Browser: Google Chrome 92.0.4515.159
- Operating System: Ubuntu 20.04.3 LTS
- Terminal: GNOME Terminal 3.36.2

## ZSH Custom

- `zsh-autosuggestions` ([Install](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh) | [Repo](https://github.com/zsh-users/zsh-autosuggestions))
- `zsh-syntax-highlighting` ([Install](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh) | [Repo](https://github.com/zsh-users/zsh-syntax-highlighting))
- `powerlevel10k` ([Install](https://github.com/romkatv/powerlevel10k#oh-my-zsh) | [Repo](https://github.com/romkatv/powerlevel10k))
- `zsh-completions` ([Install](https://github.com/zsh-users/zsh-completions#oh-my-zsh) | [Repo](https://github.com/zsh-users/zsh-completions))
- `yeoman-zsh-plugin` ([Install](https://github.com/edouard-lopez/yeoman-zsh-plugin#oh-my-zsh) | [Repo](https://github.com/edouard-lopez/yeoman-zsh-plugin))

## File Structure

- `.config/` (Contains main configuration for Visual Studio Code)
- `.vscode/` (Contains all extensions)
- `scripts/` (Contains bash scripts)
- `.gitconfig` (Contains git configuration)
- `.nanorc` (Contains code to load nano syntax highlighting files)
- `.npmrc` (Contains npm configuration)
- `.nvmrc` (Contains the installed NodeJS version)
- `.p10k.zsh` (Contains mostly autogenerated configuration for powerlevel10k)
- `.vimrc` (Contains setup configuration for `vim`)
- `.zshrc` (Startup script for `zsh`, with plugin, theme, alias, `PATH` loading, etc. setup)
- `.zlogout` (Script that's sourced when login shells exit)
- `gterminal.preferences` (`dconf` dump of GNOME terminal preferences)
- `gterminal.preferences.sh` (Installation script for `gterminal.preferences`)

## Installation

Everything in the repository can be copied into the `$HOME` or `~/` directory except
for the `gterminal.preferences` which will have to be loaded (see [`gterminal.preferences.sh`](./gterminal.preferences.sh)). For the `zsh` custom plugins/theme, you will have to [install them separately](#zsh-custom).
See [this link](https://khalidabuhakmeh.com/ohmyzsh-github-cli-command-completion) for installing the `gh`
command line autocompletion.
