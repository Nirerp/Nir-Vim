#!/bin/bash

# Nir-Vim Installation Script for macOS
# This script installs all prerequisites and sets up Nir-Vim configuration

set -e  # Exit on any error

echo "🚀 Starting Nir-Vim installation for macOS..."

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

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    print_status "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    print_status "Homebrew found. Updating..."
    brew update
fi

# Install core dependencies
print_status "Installing core dependencies..."
brew install \
    git \
    node \
    python3 \
    neovim \
    lazygit \
    wget \
    unzip

# Install Python packages
print_status "Installing Python packages..."
pip3 install --user \
    pynvim \
    debugpy \
    isort \
    ruff \
    black \
    pylint

# Install Nerd Font (CascadiaCode)
print_status "Installing CascadiaCode Nerd Font..."
if brew list --cask font-cascadia-code-nerd-font &> /dev/null; then
    print_warning "CascadiaCode Nerd Font is already installed. Skipping..."
else
    brew tap homebrew/cask-fonts
    brew install --cask font-cascadia-code-nerd-font
fi

# Install live-server globally
print_status "Installing live-server..."
npm install -g live-server

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
echo "1. Restart your terminal or run 'source ~/.zshrc' (or ~/.bash_profile)"
echo "2. Make sure your terminal is using CascadiaCode Nerd Font"
echo "3. Run 'nvim' to start Neovim"
echo "4. Lazy.nvim will automatically install all plugins on first run"
echo ""
echo "Note: If you're using iTerm2 or Terminal.app, you may need to:"
echo "- Go to Preferences → Profiles → Text → Font"
echo "- Select 'CaskaydiaCove Nerd Font' or 'CascadiaCode Nerd Font'"
echo ""
echo "Optional:"
echo "- Copy ~/.config/nvim/.env.example to ~/.config/nvim/.env and customize if needed"
echo ""
echo "Enjoy coding with Nir-Vim! 🚀"