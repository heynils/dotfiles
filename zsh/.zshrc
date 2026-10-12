# Inherited PATH/FPATH from parent shells would otherwise pile up duplicates.
# Only array assignments (path=(...)) dedupe; export PATH=... does not.
typeset -U path fpath

path=($HOME/bin /usr/local/bin $HOME/.dotnet/tools $HOME/.local/share/lsp/rust-analyzer $HOME/.cargo/bin $HOME/Library/Python/3.9/bin $path)
export DOTNET_ROOT=$HOME/.dotnet

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode auto      # update automatically without asking
plugins=(
zsh-autosuggestions
zsh-syntax-highlighting
)

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# brew shellenv exports FPATH, so child shells (new panes) inherit oh-my-zsh's
# entries. Drop them so fpath matches the compdump and it isn't rebuilt every time.
fpath=(${fpath:#$ZSH/*})

source $ZSH/oh-my-zsh.sh

# Create as alias for nuget
alias nuget="mono /usr/local/bin/nuget.exe"

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

export HOMEBREW_NO_ENV_HINTS=1

if [[ "$OSTYPE" == "darwin"* ]]; then
    alias cat='bat'
    alias ls='eza -la'
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias cat='batcat'
    alias ls='exa -la'
else
    echo "Unknown OS: $OSTYPE"
fi

alias vim='nvim'
alias vi='nvim'

#python
alias python='python3'

#lazygit
alias lg='lazygit'

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || path=($PYENV_ROOT/bin $path)

#zoxide
eval "$(zoxide init zsh)"

#starship prompt
eval "$(starship init zsh)"

path+=($DOTNET_ROOT $DOTNET_ROOT/tools)
export EDITOR=nvim
export VISUAL=nvim

# Start in git/
# cd ~/git/

path=($HOME/.local/bin /opt/homebrew/opt/node@24/bin $path)
