# 🚀 Custom Neovim Configuration

A personalized Neovim setup built on top of [LazyVim](https://github.com/LazyVim/LazyVim), featuring a curated selection of plugins and customizations for an enhanced development experience.

## ✨ Features

- 🎨 **Theme**: [Catppuccin](https://github.com/catppuccin/nvim) color scheme for a modern and pleasant coding experience
- 📁 **File Navigation**: 
  - [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) for file browsing
  - [Telescope](https://github.com/nvim-telescope/telescope.nvim) for fuzzy finding
  - [Harpoon](https://github.com/ThePrimeagen/harpoon) for quick file switching
- 🔍 **Development Tools**:
  - Built-in LSP configuration with [Mason](https://github.com/williamboman/mason.nvim)
  - Auto-formatting and linting setup
  - [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for better syntax highlighting
- 🔄 **Git Integration**:
  - Advanced git commands and diffview
  - Inline git blame and changes
- ⚡ **Quality of Life**:
  - Terminal integration with [FTerm](https://github.com/numToStr/FTerm.nvim)
  - Auto-session management
  - Enhanced text objects and surrounds
  - Smart commenting system
  - Flash for quick navigation
  - Custom status line with Lualine

## 🛠️ Structure

```
lua/
├── config/           # Core configuration
│   ├── keymaps.lua  # Key mappings
│   ├── lazy.lua     # Plugin manager setup
│   └── options.lua  # Neovim options
└── plugins/         # Plugin configurations
    ├── lsp/        # LSP related settings
    └── ...         # Other plugin configs
```

## ⚙️ Installation

1. Backup your existing Neovim configuration
2. Clone this repository:
   ```bash
   git clone https://github.com/atanasna/dotfiles.git
   cd dotfiles/nvim/config
   ```
3. Start Neovim and let LazyVim install all plugins

## 🎯 Getting Started

- Run `:Lazy` to manage plugins
- Run `:Mason` to manage LSP servers, formatters, and linters
- Check `:help` for detailed documentation
- Use the built-in key binding helper with `Space + k`

## 🔑 Key Features

- Session Management: Automatically saves and restores your workspace
- Enhanced Navigation: Quick file switching with Harpoon and Flash
- Modern UI: Clean and minimal interface with useful status information
- Git Integration: Powerful git operations without leaving Neovim
- Smart Completions: Context-aware code completion and snippets

For more detailed documentation, refer to [LazyVim's documentation](https://lazyvim.github.io).
