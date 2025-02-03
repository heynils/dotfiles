#!/bin/zsh

ln -s ~/git/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/git/dotfiles/lazygit/config.yml ~/.config/lazygit/config.yml
ln -s ~/git/dotfiles/nvim/ ~/.config/nvim/
ln -s ~/git/dotfiles/wezterm/.wezterm.lua ~/.wezterm.lua

echo "Dotfiles symlinked, restarting zsh..."
source ~/.zshrc
