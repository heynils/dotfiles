#!/bin/zsh

ln -s ~/git/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/git/dotfiles/lazygit/config.yml ~/.config/lazygit/config.yml
ln -s ~/git/dotfiles/starship/starship.toml ~/.config/starship.toml
ln -s ~/git/dotfiles/nvim/ ~/.config/
sudo ln -s ~/dotfiles/wsl/wsl.conf /etc/wsl.conf

echo "Dotfiles symlinked, restarting zsh..."
source ~/.zshrc
