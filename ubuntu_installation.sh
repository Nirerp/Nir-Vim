#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Error handling
set -e
trap 'echo -e "${RED}Error: Script failed on line $LINENO${NC}"' ERR

# Helper functions
log() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

# Check if running as root
if [ "$EUID" -eq 0 ]; then 
    echo -e "${RED}Please don't run as root/sudo${NC}"
    exit 1
fi

# Backup existing config
if [ -d ~/.config/nvim ]; then
    log "Backing up existing neovim config..."
    mv ~/.config/nvim ~/.config/nvim.bak.$(date +%Y%m%d_%H%M%S)
fi

# Remove old nvim data
log "Cleaning old neovim data..."
rm -rf ~/.local/share/nvim/

# Update package list
log "Updating package list..."
sudo apt update

# Install dependencies
log "Installing dependencies..."
PACKAGES=(
    curl
    python3-pip
    python3-neovim
    python3-debugpy
    python3-isort
    python3-ruff
    python3-venv
    nodejs
    npm
    unzip
    wget
)

for pkg in "${PACKAGES[@]}"; do
    if ! dpkg -l | grep -q "^ii  $pkg "; then
        sudo apt install -y "$pkg"
    fi
done

# Install neovim
log "Installing neovim..."
sudo snap install nvim --classic --edge

# Install LazyGit
log "Installing LazyGit..."
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# Install Fonts
log "Installing NerdFonts..."
FONT_DIR="/usr/share/fonts/CaskaydiaCoveNerdFont"
sudo mkdir -p "$FONT_DIR"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/CascadiaCode.zip"
wget "$FONT_URL" -O CascadiaCode.zip
if [ $? -eq 0 ]; then
    sudo unzip -o CascadiaCode.zip -d "$FONT_DIR"
    sudo fc-cache -fv
    success "Fonts installed successfully"
else
    echo -e "${RED}Error downloading fonts${NC}"
    exit 1
fi

# Install live-server
log "Installing live-server..."
sudo npm install -g live-server

# Copy nvim configuration
log "Installing neovim configuration..."
if [ -d "./nvim" ]; then
    cp -r nvim/ ~/.config/
else
    echo -e "${RED}Error: nvim configuration folder not found${NC}"
    exit 1
fi

# Cleanup downloaded files
log "Cleaning up..."
rm -f lazygit.tar.gz lazygit CascadiaCode.zip

success "Installation completed successfully!"
