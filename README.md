# Nir-Vim: A Neovim Distro for ML & AI Engineers

![Nir-Vim Home](assets/nir-vim1.png)

Nir-Vim is a blazing-fast Neovim configuration tailored for AI and Machine Learning development. Built on top of the powerful [LazyVim](https://github.com/LazyVim/LazyVim) package manager, it provides intuitive key mappings, extensive plugin support, and a seamless IDE experience for Python, C, C++, and more.

---

## ✨ Key Features

-   **Specialized for AI/ML**: Comes with a rich set of custom snippets for `scikit-learn`, `PyTorch`, `TensorFlow`, and `Hugging Face Transformers` to accelerate your model development workflow.
-   **Custom Compiler**: Quickly compile and run Python, C, and C++ code directly from Neovim with a single keystroke (`<F6>`).
-   **Modular & Clean**: Plugin configurations are neatly organized in a `lua/config` directory, making the setup easy to manage, customize, and extend.
-   **Powerful LSP & Tooling**: Integrates with [Mason.nvim](https://github.com/williamboman/mason.nvim) to easily manage LSP servers, linters, and formatters.
-   **Beautiful & Functional UI**: A carefully selected set of UI plugins, including a file explorer, statusline, and multiple themes, provide a modern and intuitive user experience.
-   **Git Integration**: Seamlessly integrated with Git through plugins like Gitsigns and a built-in Lazygit terminal UI.

## 🚀 Installation

### Quick Start (Platform-Specific Scripts)

Choose your operating system and run the corresponding installation script:

#### 🐧 **Ubuntu/Debian**
```bash
git clone https://github.com/Nirerp/Nir-Vim.git
cd Nir-Vim
chmod +x scripts/debian_install.sh
./scripts/debian_install.sh
```

#### 🍎 **macOS**
```bash
git clone https://github.com/Nirerp/Nir-Vim.git
cd Nir-Vim
chmod +x scripts/mac_install.sh
./scripts/mac_install.sh
```

#### 🏛️ **Arch Linux**
```bash
git clone https://github.com/Nirerp/Nir-Vim.git
cd Nir-Vim
chmod +x scripts/arch_install.sh
./scripts/arch_install.sh
```

These scripts will automatically:
- Install all required dependencies (Neovim, Node.js, Python packages, etc.)
- Install and configure a Nerd Font (CascadiaCode)
- Install LazyGit for Git integration
- Install live-server for web development
- Backup your existing Neovim configuration
- Set up Nir-Vim in `~/.config/nvim`

The first time you start Neovim with `nvim`, Lazy.nvim will automatically install all plugins.

#### What the Installation Scripts Do

Each platform-specific script automatically handles:

✅ **System Dependencies**: Installs Git, Node.js, npm, Python 3, and build tools  
✅ **Neovim**: Installs the latest stable version of Neovim  
✅ **Python Packages**: Installs pynvim, debugpy, isort, ruff, black, and pylint  
✅ **LazyGit**: Installs LazyGit for seamless Git integration  
✅ **Nerd Font**: Downloads and installs CascadiaCode Nerd Font  
✅ **live-server**: Installs live-server globally for web development  
✅ **Backup**: Safely backs up your existing Neovim configuration  
✅ **Configuration**: Copies Nir-Vim configuration to `~/.config/nvim`  

### Legacy Installation (Ubuntu/Debian only)
For Ubuntu/Debian systems, you can also use the original installation script:

```bash
git clone https://github.com/Nirerp/Nir-Vim.git
cd Nir-Vim
chmod +x install_nirvim.sh
./install_nirvim.sh
```

### Manual Installation
<details>
<summary>Click to expand for manual installation steps</summary>

If you prefer to install the dependencies manually, follow the steps below for your distribution.

#### Prerequisites
All platforms require:
- **Git** (for cloning repositories)
- **Node.js & npm** (v16+ recommended)
- **Python 3** (v3.8+ with pip)
- **Neovim** (v0.9.5+)
- **A Nerd Font** (for proper icon rendering)
- **LazyGit** (for Git integration)

#### Platform-Specific Instructions

##### 🐧 **Ubuntu/Debian**
```bash
# Update package list
sudo apt update

# Install core dependencies
sudo apt install -y git nodejs npm python3 python3-pip python3-venv curl wget unzip

# Install Neovim (latest stable)
sudo snap install nvim --classic

# Install Python packages
pip3 install --user pynvim debugpy isort ruff black pylint

# Install LazyGit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# Install live-server
sudo npm install -g live-server
```

##### 🍎 **macOS**
```bash
# Install Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install dependencies
brew install git node python3 neovim lazygit

# Install Python packages
pip3 install --user pynvim debugpy isort ruff black pylint

# Install live-server
npm install -g live-server
```

##### 🏛️ **Arch Linux**
```bash
# Update system
sudo pacman -Syu

# Install core dependencies
sudo pacman -S --noconfirm git nodejs npm python python-pip neovim base-devel

# Install Python packages (prefer pacman when available)
sudo pacman -S --noconfirm python-pynvim python-isort python-black python-pylint
pip install --user debugpy ruff

# Install LazyGit (using AUR helper like yay)
yay -S lazygit
# Or install manually if no AUR helper available

# Install live-server
sudo npm install -g live-server
```

#### Install a Nerd Font
A Nerd Font is required for icons to render correctly:

- **Ubuntu/Debian**: Download and install manually from [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
- **macOS**: `brew install --cask font-cascadia-code-nerd-font`
- **Arch Linux**: `sudo pacman -S ttf-cascadia-code-nerd` or install from AUR

#### Final Setup
```bash
# Backup existing Neovim configuration
mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null || true
mv ~/.local/share/nvim ~/.local/share/nvim.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null || true

# Clone Nir-Vim configuration
git clone https://github.com/Nirerp/Nir-Vim.git
cp -r Nir-Vim/nvim ~/.config/

# Start Neovim to trigger plugin installation
nvim
```

The first time you start Neovim, Lazy.nvim will automatically install all plugins.

</details>

## 📁 Folder Structure

This configuration follows a clean and modular structure, making it easy to find and modify any part of the setup.

```
.
├── init.lua                -- Main entry point
├── lua/
│   ├── keymaps.lua         -- Global keymappings
│   ├── python_snippets.lua -- Custom Python snippets for ML/AI
│   ├── compiler.lua        -- Custom compiler logic
│   ├── vim-options.lua     -- Core Neovim options
│   ├── plugins/
│   │   ├── colorschemes.lua-- All colorscheme plugins
│   │   └── ...             -- Other plugin specifications
│   └── config/
│       ├── colorschemes/   -- Configurations for themes
│       ├── telescope.lua   -- Telescope configuration
│       └── ...             -- Configurations for other plugins
└── lazy-lock.json          -- Managed by LazyVim for reproducible builds
```
-   `init.lua`: The main file that loads everything else.
-   `lua/plugins/`: Contains the specifications for all your plugins.
-   `lua/config/`: Contains the configuration logic for your plugins. This keeps the `plugins` directory clean and focused on *what* to load, while the `config` directory handles *how* to load it.

## 🔌 Key Plugins

Here is a curated list of plugins included in this configuration, grouped by functionality.

### Core & Utility

| Plugin                                                        | Description                                            |
| ------------------------------------------------------------- | ------------------------------------------------------ |
| [lazy.nvim](https://github.com/folke/lazy.nvim)               | The package manager that powers this entire configuration. |
| [which-key.nvim](https://github.com/folke/which-key.nvim)     | Displays available keybindings in a popup.             |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)    | A collection of configurations for the built-in LSP.   |
| [mason.nvim](https://github.com/williamboman/mason.nvim)      | Manages LSP servers, linters, and formatters.          |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Provides advanced syntax highlighting and code analysis. |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)               | A powerful completion engine.                          |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip)                | The snippet engine powering your custom ML/AI snippets. |

### AI/ML & Development Workflow

| Plugin                                                        | Description                                                  |
| ------------------------------------------------------------- | ------------------------------------------------------------ |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | A highly extendable fuzzy finder for files, buffers, and more. |
| [trouble.nvim](https://github.com/folke/trouble.nvim)         | A pretty list for diagnostics, references, and more.       |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint)        | An asynchronous linting framework.                       |
| [conform.nvim](https://github.com/stevearc/conform.nvim)      | A lightweight and opinionated formatting plugin.         |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlights and manages TODO comments.                      |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)      | A terminal UI for Git, integrated directly into Neovim.    |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Manages multiple terminal windows for tasks like the compiler. |

### UI & Aesthetics

| Plugin                                                        | Description                                                              |
| ------------------------------------------------------------- | ------------------------------------------------------------------------ |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | A fast and customizable statusline.                                  |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | Provides beautiful icons for files and UI elements.                      |
| [dressing.nvim](https://github.com/stevearc/dressing.nvim) | A plugin to improve the default `vim.ui` interfaces.                 |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Adds indentation guides with highlighting.                     |
| *Multiple Themes*                                             | Includes Dracula, Ayu, Catppuccin, and more for easy customization. |

## 🔧 Troubleshooting

### Common Issues

**Script Permission Denied**
```bash
chmod +x scripts/<platform>_install.sh
```

**Neovim Not Found After Installation**
- Restart your terminal
- Check if Neovim is in your PATH: `which nvim`
- On Ubuntu/Debian: Try `sudo snap refresh nvim`

**Icons Not Displaying Correctly**
- Ensure your terminal is using a Nerd Font
- Restart your terminal after font installation
- Check terminal font settings

**Plugin Installation Fails**
- Ensure you have internet connection
- Run `:Lazy sync` inside Neovim to retry
- Check `:checkhealth` for missing dependencies

**Python LSP Issues**
- Ensure Python packages are installed: `pip3 list | grep pynvim`
- Run `:Mason` to check LSP server status
- Try `:LspRestart` if servers aren't working

### Environment Variables (Optional)

Nir-Vim supports optional environment variables via a `.env` file:

```bash
# Copy the example file and customize
cp ~/.config/nvim/.env.example ~/.config/nvim/.env
# Edit with your preferred settings
nvim ~/.config/nvim/.env
```

---

## 💡 Usage

### Key Bindings

-   **`<Leader> = Space`**: Opens [WhichKey](https://github.com/folke/which-key.nvim) to display all available key mappings.
-   **`<F6>`**: Opens a Toggle-Term and runs the custom compiler for the current file (Python, C, or C++).

### Custom Python Snippets

#### ML Snippets

Nir-Vim comes with pre-configured Python snippets tailored for AI/ML workflows. Type a trigger (e.g., `knn`, `ptmodel`) and press your snippet expansion key to use them.

![Nir-Vim Snippet Example](assets/nir-vim-snippet.png)

#### PyTorch Snippets

![image](https://github.com/user-attachments/assets/df483051-88f7-404c-b8c6-74d9cfca162a)

#### Tensorflow Snippets

![image](https://github.com/user-attachments/assets/eb80804c-c332-4509-9405-072aec719911)


---

## Screenshots & Demo

![Nir-Vim in Action](assets/nir-vim2.png)

### Demo Video
[![Watch the demo](path/to/video-thumbnail.png)](assets/demo.mp4)

---

## Credits

This configuration is made possible by the incredible work of the Neovim community and the creators of the many plugins used in this build. A special thanks to the teams behind **LazyVim**, **Telescope**, **Treesitter**, and all other plugins:

- [LazyVim](https://github.com/LazyVim/LazyVim)
- [alpha-nvim](https://github.com/goolord/alpha-nvim)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [vscode.nvim](https://github.com/Mofiqul/vscode.nvim)
- [neovim-ayu](https://github.com/Shatur/neovim-ayu)
- [catppuccin.nvim](https://github.com/catppuccin/nvim)
- [dracula.nvim](https://github.com/Mofiqul/dracula.nvim)
- [onedark.nvim](https://github.com/navarasu/onedark.nvim)
- [nightfox.nvim](https://github.com/EdenEast/nightfox.nvim)
- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [rainbow_csv.nvim](https://github.com/cameron-wags/rainbow_csv.nvim)
- [dressing.nvim](https://github.com/stevearc/dressing.nvim)
- [conform.nvim](https://github.com/stevearc/conform.nvim)
- [vim-illuminate](https://github.com/RRethy/vim-illuminate)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)
- [nvim-lint](https://github.com/mfussenegger/nvim-lint)
- [live-server.nvim](https://github.com/barrett-ruth/live-server.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [vim-isort](https://github.com/fisadev/vim-isort)
- [which-key.nvim](https://github.com/folke/which-key.nvim) 

---

## License

[MIT License](LICENSE) 
