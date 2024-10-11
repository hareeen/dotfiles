if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH /usr/local/go/bin $PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

mise activate fish | source
starship init fish | source
zoxide init fish | source
mcfly init fish | source
