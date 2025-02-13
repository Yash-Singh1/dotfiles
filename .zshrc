# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Root directory
if [[ "$PWD" == "$HOME" ]]; then
  cd $HOME/p
fi
export HOME_MAIN="$HOME/p"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

ZSH_THEME="powerlevel10k/powerlevel10k"

# Switched to powerlevel10k, this is no longer needed
# agnoster theme setup
# DEFAULT_USER='saiansh'
# prompt_context() {}

# Used previously for bash completion interop or smth
# alias shopt="/usr/bin/shopt"

# Oh My ZSH Auto Updating
zstyle ':omz:update' mode background-alpha
zstyle ':omz:update' frequency 1 # daily

CASE_SENSITIVE="true"
DISABLE_MAGIC_FUNCTIONS="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git colorize history safe-paste command-not-found coffee heroku npm yarn nvm node vscode zsh-autosuggestions zsh-syntax-highlighting zsh-interactive-cd zsh-completions gh zsh-plugin-speedtest docker docker-compose docker-machine)

# Autosuggestion configuration
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#f54257,bold"

# Interactive cd configuration
export FZF_DEFAULT_OPTS="--cycle --border"

# Load Oh My ZSH
source $ZSH/oh-my-zsh.sh

# Load completion
autoload -U compinit && compinit

# Add spacing at top of prompt
export PS1="
$PS1"

# Setup man
export MANPATH="/usr/local/man:$MANPATH"

# Set language
export LANG=en_US.UTF-8

# if ! shopt -oq posix; then
#   if [ -f /usr/share/bash-completion/bash_completion ]; then
#     bash /usr/share/bash-completion/bash_completion
#   elif [ -f /etc/bash_completion ]; then
#     bash /etc/bash_completion
#   fi
# fi

# History file configuration
export HISTSIZE=1000
# export HISTFILESIZE=2000 # HISTFILESIZE (bash) is SAVEHIST in zsh
export SAVEHIST=2000

# Aliases for personal use
alias uncd="cd $OLDPWD"
alias total="bash ~/better-git-diff/total.sh"
alias tellme='bash ~/tellme.sh'
alias pcat='/bin/cat'
# alias cat='ccat'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias for removing last commit in git
alias remove-last-commit='git reset --hard HEAD^'

# Create an alias for sshtron to play it easily
alias tron='ssh sshtron.zachlatta.com'

# Create an alias for launching Notepad++
alias notepad++='notepad-plus-plus'

# Setup Python
alias python='python3'
alias py='python3'
alias pip='pip3'

pretty_json() {
  echo $@ | python -m json.tool
}

# Add in an alias to easily open up Postman
alias postman='/snap/bin/postman'

# Add in an alias to easily open up Spotify
alias spotify='/snap/bin/spotify'

# Add an alias to set the volume
alias vol='amixer -D pulse sset Master --quiet'

# Add an alias for opening in Files - Ubuntu
# alias open='xdg-open $PWD'

# Add an alias to run the development enviorment using nodemon
alias devr='pnpm run dev'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=critical -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# ZSH nvm plugin should automatically do this

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

export EDITOR="code"

# Setup golang
export GOROOT=/usr/local/go
export GOPATH=~/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Setup Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Disable husky due to problems in zsh (https://github.com/typicode/husky/issues/953)
export HUSKY=0

# Disable core dumps
ulimit -c 0

# Freeze terminal driver settings (prevents keyboard messing)
ttyctl -f

# Set options
setopt auto_pushd
setopt pushd_ignoredups
setopt pushd_silent
setopt interactive_comments

# Set pager to less
PAGER=less

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Personal scripts
export PATH="$HOME/p/scripts:$HOME/.local/bin:$PATH"

# Remove zsh extention
for c in $(ls $HOME/p/scripts | grep .zsh$); do
  if ! type ${c%.*} > /dev/null; then
    alias ${c%.*}="$c"
  fi
done

fpath+=${ZDOTDIR:-~}/.zsh_functions

export TERM=xterm-256color

alias vscq="vsc &!"

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

tmux set-environment TMUX_PLUGIN_MANAGER_PATH "$HOME/.tmux/plugins/"

# Prevent weird behavior in alacritty
export WINIT_X11_SCALE_FACTOR="1.0"

# Launch Polybar if it already didn't
# Not going to use polybar for mac
# bash ~/.config/polybar/launch.sh --cuts

# Jetbrains Fleet
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"

# Fly.io CLI
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

alias comp="g++ -Wall -std=c++17 -fdiagnostics-color=always"

# bun completions
[ -s "/Users/yashsingh/.bun/_bun" ] && source "/Users/yashsingh/.bun/_bun"

# aoc aliases
alias aois="bun silver.ts in.txt"
alias aoig="bun gold.ts in.txt"
alias aots="bun silver.ts test.txt"
alias aotg="bun gold.ts test.txt"

# export PATH="$(brew --prefix llvm@17)/bin:$PATH"

ao() {
  osascript -e "tell application \"Arc\"
  make new tab with properties {URL:\"$1\"}
  activate
end tell"
}

# Added by LM Studio CLI tool (lms)
export PATH="$PATH:/Users/yashsingh/.cache/lm-studio/bin"

# manually compdef pnpm
compdef _pnpm pnpm

packhella() {
  ZSTD_NBTHREADS=12 gtar -I 'zstd -19' -cvpf $1.tar.zst $1
}

export MANPAGER='nvim +Man!'
