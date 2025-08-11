# Nir-Vim Installation Scripts

This directory contains platform-specific installation scripts for Nir-Vim. Each script automatically installs all prerequisites and sets up the Nir-Vim configuration.

## Available Scripts

### `debian_install.sh` - Ubuntu/Debian Installation
- **Target**: Ubuntu, Debian, and other Debian-based distributions
- **Package Manager**: apt
- **Neovim Installation**: via snap (latest stable)
- **Font Installation**: Manual download and installation

### `mac_install.sh` - macOS Installation  
- **Target**: macOS (Intel and Apple Silicon)
- **Package Manager**: Homebrew
- **Neovim Installation**: via Homebrew
- **Font Installation**: via Homebrew Cask

### `arch_install.sh` - Arch Linux Installation
- **Target**: Arch Linux and Arch-based distributions
- **Package Manager**: pacman (with optional AUR support)
- **Neovim Installation**: via pacman
- **Font Installation**: via pacman or manual installation

## Usage

1. Clone the Nir-Vim repository:
   ```bash
   git clone https://github.com/Nirerp/Nir-Vim.git
   cd Nir-Vim
   ```

2. Make the script executable and run it:
   ```bash
   chmod +x scripts/<your_platform>_install.sh
   ./scripts/<your_platform>_install.sh
   ```

## What Each Script Does

All scripts perform the following actions:

1. **Update System**: Updates package databases
2. **Install Core Dependencies**: Git, Node.js, npm, Python 3, build tools
3. **Install Neovim**: Latest stable version (v0.9.5+)
4. **Install Python Packages**: pynvim, debugpy, isort, ruff, black, pylint
5. **Install LazyGit**: For Git integration within Neovim
6. **Install Nerd Font**: CascadiaCode Nerd Font for proper icon rendering
7. **Install live-server**: Global npm package for web development
8. **Backup Existing Config**: Safely backs up existing Neovim configuration
9. **Install Nir-Vim**: Copies configuration to `~/.config/nvim`

## Requirements

- **Root/sudo access**: Required for installing system packages
- **Internet connection**: For downloading packages and fonts
- **Bash shell**: All scripts are written in bash

## Troubleshooting

If you encounter issues:

1. **Permission denied**: Make sure the script is executable (`chmod +x script_name.sh`)
2. **Package not found**: Ensure your system is up to date
3. **Network issues**: Check your internet connection
4. **Existing configuration**: Scripts automatically backup existing configs

## Manual Installation

If the automated scripts don't work for your system, refer to the manual installation instructions in the main README.md file.