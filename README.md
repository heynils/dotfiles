# dotfiles
Dotfiles and configurations.  

# zsh
install zsh  
`sudo apt install zsh`  
install oh-my-zsh  
`sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`  

download some plugins  
`
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`    
`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting  
`  

to restart shell  
`source .~/.zshrc`

# starship
install starship  
`curl -sS https://starship.rs/install.sh | sh`  

# zoxide
install zoxide   
`curl -sS https://webinstall.dev/zoxide | bash`  


