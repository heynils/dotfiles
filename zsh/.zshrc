export PATH=$HOME/bin:/usr/local/bin:$HOME/.dotnet/tools:$HOME/.local/share/lsp/rust-analyzer:$HOME/.cargo/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode auto      # update automatically without asking
plugins=(
zsh-autosuggestions
zsh-syntax-highlighting
)

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

#Git
alias gs='git status'
alias gc='git checkout'
alias gp='git pull'
alias gpo='git push origin'
alias gcam='git commit -am'
alias gcm='git commit -m'
alias gl="git log --pretty=format:'%C(yellow)%h %Cgreen%ah %Cblue%aN %Creset%s %Cred %d'"
alias gd='git diff'
alias ga.='git add .'

#Other
alias cat='batcat'
alias ls='exa -la'
alias vim='nvim'
alias vi='nvim'

#python
alias python='python3'

#lazygit
alias lg='lazygit'

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

#zoxide
eval "$(zoxide init zsh)"

#starship prompt
eval "$(starship init zsh)"

export DOTNET_ROOT=/usr/lib/dotnet/
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
export EDITOR=/usr/local/bin/nvim
export VISUAL=/usr/bin/local/nvim

# Start in git/
cd ~/git/
