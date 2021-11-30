#!/bin/zsh

for module in better-git-diff nano-mermaid nano-tiprogram .oh-my-zsh .nano $(ls .vscode/extensions/ | sed 's/^/.vscode\/extensions\//'); do
  cd ~/dotfiles/$module
  git pull
  cd ~/dotfiles
done
