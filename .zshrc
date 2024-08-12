export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias sudo="sudo "
alias ls="eza"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
