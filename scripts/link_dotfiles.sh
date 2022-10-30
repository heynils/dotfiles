#!/bin/zsh

ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/starship/starship.toml ~/.config/starship.toml
ln -s ~/dotfiles/nvim/ ~/.config/
ln -s ~/dotfiles/tmux/tmux.conf ~/.config/tmux/tmux.conf

echo "Dotfiles symlinked, restarting zsh..."
source ~/.zshrc
