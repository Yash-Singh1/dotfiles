![dotfile logo](https://raw.githubusercontent.com/jglovier/dotfiles-logo/main/dotfiles-logo.svg)

These are my dotfiles.

## Environment

- Browser: Google Chrome 92.0.4515.159
- Operating System: Ubuntu 20.04.3 LTS
- Terminal: GNOME Terminal 3.36.2

## File Structure

- `.config/` (Contains main configuration for apps)
- `.vscode/` (Contains all extensions in a file)
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

1. Setup [ZSH](https://zsh.sourceforge.io/) and [Oh My ZSH](https://ohmyz.sh/).
2. VSCode Configuration and Extensions
   To install the VSCode Configuration, copy the configuration from `.config/Code/User/settings.json`
   and paste it into the JSON for your VSCode configuration.
3. Nano Editor Extensions
   See this [section](#nano-editor-extensions).
4. Setup [`better-git-diff`](https://github.com/Yash-Singh1/better-git-diff) for Linux
5. `gterminal.preferences` will have to be loaded (see [`gterminal.preferences.sh`](./gterminal.preferences.sh)).
6. For the `zsh` custom plugins/theme, you will have to [install them separately](#zsh-custom).
7. See [this link](https://khalidabuhakmeh.com/ohmyzsh-github-cli-command-completion) for installing the `gh` command line autocompletion.
8. Copy files from `dotfiles`

- `scripts/` (setup in `PATH` too)
- `.vimrc`
- `.zlogout`, `.zshrc`
- `p10k.zsh` (contains some customization for `powerlevel10k`, rest autogenerated)
- `.gitconfig` (also setup other information such as email and username)
- `.nvmrc` (automatically installed version of `nodejs` by `nvm`)
- `.npmrc` (also setup other information such as email and username)

## ZSH Custom

- `zsh-autosuggestions` ([Install](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh) | [Repo](https://github.com/zsh-users/zsh-autosuggestions))
- `zsh-syntax-highlighting` ([Install](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh) | [Repo](https://github.com/zsh-users/zsh-syntax-highlighting))
- `powerlevel10k` ([Install](https://github.com/romkatv/powerlevel10k#oh-my-zsh) | [Repo](https://github.com/romkatv/powerlevel10k))
- `zsh-completions` ([Install](https://github.com/zsh-users/zsh-completions#oh-my-zsh) | [Repo](https://github.com/zsh-users/zsh-completions))
- `yeoman-zsh-plugin` ([Install](https://github.com/edouard-lopez/yeoman-zsh-plugin#oh-my-zsh) | [Repo](https://github.com/edouard-lopez/yeoman-zsh-plugin))
- `zsh-plugin-speedtest` ([Install](https://github.com/Yash-Singh1/zsh-plugin-speedtest#oh-my-zsh) | [Repo](https://github.com/Yash-Singh1/zsh-plugin-speedtest))

## Nano Editor Extensions

To install the nano editor extensions, setup [`scopatz/nanorc`](https://github.com/scopatz/nanorc)
and install [`nano-mermaid`](https://github.com/Yash-Singh1/nano-mermaid) and [`nano-nocode`](https://github.com/Yash-Singh1/nano-nocode). Also, load the `.nanorc` file in the repository.
