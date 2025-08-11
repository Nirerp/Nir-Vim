#!/bin/bash

# Nir-Vim Installation Script for Arch Linux
# This script installs all prerequisites and sets up Nir-Vim configuration

set -e  # Exit on any error

echo "🚀 Starting Nir-Vim installation for Arch Linux..."

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

# Update package database
print_status "Updating package database..."
sudo pacman -Syu --noconfirm

# Install core dependencies
print_status "Installing core dependencies..."
sudo pacman -S --noconfirm \
    git \
    base-devel \
    nodejs \
    npm \
    python \
    python-pip \
    neovim \
    wget \
    unzip \
    curl

# Install Python packages (prefer pacman packages when available)
print_status "Installing Python packages..."
sudo pacman -S --noconfirm \
    python-pynvim \
    python-isort \
    python-black \
    python-pylint

# Install packages not available in official repos via pip
pip install --user \
    debugpy \
    ruff

# Install LazyGit
print_status "Installing LazyGit..."
if command -v lazygit &> /dev/null; then
    print_warning "LazyGit is already installed. Skipping..."
else
    # Try to install from AUR using yay if available
    if command -v yay &> /dev/null; then
        yay -S --noconfirm lazygit
    elif command -v paru &> /dev/null; then
        paru -S --noconfirm lazygit
    else
        # Install manually if no AUR helper is available
        print_status "Installing LazyGit manually..."
        LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
        tar xf lazygit.tar.gz lazygit
        sudo install lazygit /usr/local/bin
        rm lazygit.tar.gz lazygit
    fi
fi

# Install Nerd Font (CascadiaCode)
print_status "Installing CascadiaCode Nerd Font..."
if pacman -Qs ttf-cascadia-code-nerd &> /dev/null; then
    print_warning "CascadiaCode Nerd Font is already installed. Skipping..."
else
    # Try to install from official repos first
    if sudo pacman -S --noconfirm ttf-cascadia-code-nerd 2>/dev/null; then
        print_status "Installed CascadiaCode Nerd Font from official repos"
    else
        # Install manually if not available in repos
        print_status "Installing CascadiaCode Nerd Font manually..."
        font_dir="/usr/share/fonts/CascadiaCodeNerdFont"
        sudo mkdir -p "$font_dir"
        font_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/CascadiaCode.zip"
        wget "$font_url" -O CascadiaCode.zip
        sudo unzip CascadiaCode.zip -d "$font_dir"
        sudo fc-cache -fv
        rm CascadiaCode.zip
    fi
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

# Create .config directory if it doesn't exist
mkdir -p ~/.config

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
echo "Note: If you don't have an AUR helper (yay/paru), consider installing one for easier package management:"
echo "  git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si"
echo ""
echo "Optional:"
echo "- Copy ~/.config/nvim/.env.example to ~/.config/nvim/.env and customize if needed"
echo ""
echo "Enjoy coding with Nir-Vim! 🚀"