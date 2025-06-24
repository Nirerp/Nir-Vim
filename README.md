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

### Automated Installation (Recommended)
To simplify the setup process, Nir-Vim includes an installation script. Run the following commands to install all prerequisites and Nir-Vim:

```bash
git clone https://github.com/Nirerp/Nir-Vim.git
cd Nir-Vim
chmod +x install_nirvim.sh
./install_nirvim.sh
```
The script will handle everything from installing dependencies to setting up Nir-Vim on your system. The first time you start Neovim, Lazy.nvim will automatically install all the plugins.

### Manual Installation
<details>
<summary>Click to expand for manual installation steps</summary>

If you prefer to install the dependencies manually, follow the steps below for your distribution.

#### 1. Install Core Dependencies
-   **Debian/Ubuntu:**
    ```bash
    sudo apt update && sudo apt install -y git nodejs npm python3 python3-venv
    ```
-   **Arch Linux:**
    ```bash
    sudo pacman -Syu --noconfirm git nodejs npm python python-pip
    ```
-   **Fedora/CentOS:**
    ```bash
    sudo dnf check-update && sudo dnf install -y git nodejs npm python3 python3-pip
    ```

#### 2. Install Neovim (v0.9.5+)
It is highly recommended to install the latest stable version. Please follow the official [Neovim installation instructions](https://github.com/neovim/neovim/wiki/Installing-Neovim) for the most up-to-date method.

#### 3. Install a Nerd Font
A Nerd Font is required for icons to render correctly.
1.  Go to the [Nerd Fonts website](https://www.nerdfonts.com/font-downloads).
2.  Download a font of your choice (e.g., FiraCode, JetBrains Mono, Hack).
3.  Install the font on your system and configure your terminal emulator to use it.

#### 4. Install Additional Tools
-   **LazyGit**: Follow the installation instructions on the [LazyGit repository](https://github.com/jesseduffield/lazygit#installation).
-   **live-server** (for web development):
    ```bash
    sudo npm install -g live-server
    ```

#### 5. Clone the Nir-Vim Repository
Once all dependencies are installed, clone the Nir-Vim configuration:
```bash
# First, backup your existing Neovim configuration
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

# Then, clone the repository
git clone https://github.com/Nirerp/Nir-Vim.git ~/.config/nvim
```
The next time you start Neovim with `nvim`, all plugins will be installed automatically.

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
