get_dist() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "$ID"
    fi
    return 1
}

DIST=$(get_dist)

if [ "$(id -u)" = "0" ]; then
    Sudo=""
elif which sudo; then
    Sudo="sudo"
else
    echo "Please install sudo or run this script as root."
    exit 1
fi

if [ "$DIST" = "ubuntu" ] || [ "$DIST" = "debian" ]; then
    $Sudo apt update
    $Sudo apt install -y gpg wget curl git net-tools psmisc lsof tmux openssh-server

    # Add repositories
    $Sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | $Sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | $Sudo tee /etc/apt/sources.list.d/gierens.list
    $Sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list

    $Sudo add-apt-repository ppa:neovim-ppa/stable

    $Sudo apt update

    # Install zsh
    $Sudo apt install -y zsh
    $Sudo chsh -s $(which zsh)

    # Install tools
    $Sudo apt install -y htop neofetch bat fd-find ripgrep hyperfine zoxide fzf eza neovim
elif [ "$DIST" = "arch" ]; then
    $Sudo pacman -Syu --noconfirm

    # Install zsh
    $Sudo pacman -S --noconfirm zsh
    $Sudo chsh -s $(which zsh)

    # Install tools
    $Sudo pacman -S --noconfirm wget tmux openssh lsof net-tools git curl
    $Sudo pacman -S --noconfirm wget htop neofetch bat fd ripgrep hyperfine zoxide fzf eza neovim
else
    echo "Unsupported distribution."
    exit 1
fi

# Install oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

# Install omz plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Download zshrc
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bak
curl -sS https://meadow.hareen.io/dotfiles/misc/.zshrc -o ~/.zshrc
