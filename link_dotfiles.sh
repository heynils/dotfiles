#!/bin/zsh

ln -s ~/git/dotfiles/zsh/.zshrc ~/.zshrc

ln -s ~/git/dotfiles/lazygit/config.yml ~/.config/lazygit/config.yml

ln -s ~/git/dotfiles/nvim/ ~/.config/nvim

ln -s ~/git/dotfiles/wezterm/.wezterm.lua ~/.wezterm.lua

ln -s ~/git/dotfiles/git/.gitconfig ~/.gitconfig

ln -s ~/git/dotfiles/tmux/.tmux.conf ~/.tmux.conf

mkdir -p ~/.config/herdr
ln -s ~/git/dotfiles/herdr/config.toml ~/.config/herdr/config.toml
herdr plugin install --yes kaar/nvim-herdr-navigator

echo "Dotfiles symlinked, restarting zsh..."
source ~/.zshrc
