#!/bin/zsh

ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/starship/starship.toml ~/.config/starship.toml
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim


echo "Dotfiles symlinked, restarting zsh..."
source ~/.zshrc
