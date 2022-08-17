#!/bin/bash

ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/starship/starship.toml ~/.config/starship.toml

echo "Dotfiles symlinked, restarting zsh"
source ~/.zshrc