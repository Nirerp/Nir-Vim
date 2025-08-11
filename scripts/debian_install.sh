#!/bin/bash

# Nir-Vim Installation Script for Debian/Ubuntu
# This script installs all prerequisites and sets up Nir-Vim configuration

set -e  # Exit on any error

echo "🚀 Starting Nir-Vim installation for Debian/Ubuntu..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Update package list
print_status "Updating package list..."
sudo apt update

# Install core dependencies
print_status "Installing core dependencies..."
sudo apt install -y \
    curl \
    wget \
    git \
    unzip \
    build-essential \
    nodejs \
    npm \
    python3 \
    python3-pip \
    python3-venv \
    python3-neovim \
    python3-debugpy \
    python3-isort \
    python3-ruff

# Install Neovim (latest stable)
print_status "Installing Neovim..."
if command -v nvim &> /dev/null; then
    print_warning "Neovim is already installed. Skipping..."
else
    # Install via snap for latest version
    sudo snap install nvim --classic
fi

# Install LazyGit
print_status "Installing LazyGit..."
if command -v lazygit &> /dev/null; then
    print_warning "LazyGit is already installed. Skipping..."
else
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    rm lazygit.tar.gz lazygit
fi

# Install Nerd Font (CascadiaCode)
print_status "Installing CascadiaCode Nerd Font..."
font_dir="/usr/share/fonts/CascadiaCodeNerdFont"
if [ -d "$font_dir" ]; then
    print_warning "CascadiaCode Nerd Font directory already exists. Skipping..."
else
    sudo mkdir -p "$font_dir"
    font_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/CascadiaCode.zip"
    wget "$font_url" -O CascadiaCode.zip
    sudo unzip CascadiaCode.zip -d "$font_dir"
    sudo fc-cache -fv
    rm CascadiaCode.zip
fi

# Install live-server globally
print_status "Installing live-server..."
sudo npm install -g live-server

# Backup existing Neovim configuration
print_status "Backing up existing Neovim configuration..."
if [ -d ~/.config/nvim ]; then
    mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)
    print_warning "Existing nvim config backed up"
fi

if [ -d ~/.local/share/nvim ]; then
    mv ~/.local/share/nvim ~/.local/share/nvim.backup.$(date +%Y%m%d_%H%M%S)
    print_warning "Existing nvim data backed up"
fi

# Copy Nir-Vim configuration
print_status "Installing Nir-Vim configuration..."
cp -r nvim/ ~/.config/

# Set proper permissions
chmod -R 755 ~/.config/nvim

print_status "✅ Installation completed successfully!"
echo ""
echo "🎉 Nir-Vim has been installed!"
echo ""
echo "Next steps:"
echo "1. Restart your terminal or run 'source ~/.bashrc'"
echo "2. Make sure your terminal is using a Nerd Font"
echo "3. Run 'nvim' to start Neovim"
echo "4. Lazy.nvim will automatically install all plugins on first run"
echo ""
echo "Optional:"
echo "- Copy ~/.config/nvim/.env.example to ~/.config/nvim/.env and customize if needed"
echo ""
echo "Enjoy coding with Nir-Vim! 🚀"