<div align="center">

# Katherine's minimal neovim config

<a href="https://dotfyle.com/KatieUmbra/neovim"><img src="https://dotfyle.com/KatieUmbra/neovim/badges/plugins?style=for-the-badge" /></a>
<a href="https://dotfyle.com/KatieUmbra/neovim"><img src="https://dotfyle.com/KatieUmbra/neovim/badges/leaderkey?style=for-the-badge" /></a>
<a href="https://dotfyle.com/KatieUmbra/neovim"><img src="https://dotfyle.com/KatieUmbra/neovim/badges/plugin-manager?style=for-the-badge" /></a>

![intro](https://github.com/KatieUmbra/Neovim/blob/main/intro.png?raw=true)
![showcase](https://github.com/KatieUmbra/Neovim/blob/main/showcase.png?raw=true)

**My custom minimal neovim configuration**

</div>

## Installation
> Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository:

```sh
git clone git@github.com:KatieUmbra/Neovim ~/.config/nvim
```

Install language servers:

available package managers: `yay` `scoop`
```sh
cd ~/.config/nvim/lsp-installer
python3 install-language-servers.py -p {REQUIRED: your system package manager, eg: yay, scoop, etc..}
```

Add lsp installation directores to path:

```sh
# example with cargo using zsh
# add this to the end of your .zshrc
export PATH="PATH:/home/{YOUR_USER_FOLDER}/.cargo/bin"
```

make sure you do the same for `pip3` `npm` `cargo` and your package manager

## Configuration

the config settings file resides in `lua/settings.lua`

### Language Servers

all language servers in the array `M.language_servers` will be enabled, those not present will be disabled.

the available languages must be added with these names.

| name           | package manager | package name                       |
|----------------|-----------------|------------------------------------|
| lua            | default         | lua-language-server                |
| rust           | default         | rust-analyzer                      |
| glsl           | default         | glsl_analyzer                      |
| c              | default         | clangd                             |
| zig            | default         | zls                                |
| gleam          | default         | gleam                              |
| cmake          | cargo           | neocmakelsp                        |
| yaml           | npm             | vscode-langservers-extracted       |
| json           | npm             | vscode-langservers-extracted       |
| docker compose | npm             | @microsoft/compose-language-server |
| docker         | npm             | dockerfile-language-server-nodejs  |
| vim            | npm             | vim-language-server                |
| svelte         | npm             | svelte-language-server             |
| tailwind       | npm             | @tailwindcss/language-server       |
| toml           | npm             | @taplo/cli                         |
| sql            | npm             | sql-language-server                |
| python         | pip             | python-lsp-server                  |

```lua
M.language_servers = {
    "rust"
    ...
}
```

### Colorscheme

Currently there are 3 colorschemes, `rosepine`, `catppuccin`, `carbonfox`, and `nord`.

The variants are:

1. Rose Pine
    - default
    - moon
    - dawn

2. Catppuccin
    - latte
    - frappe
    - macchiato
    - mocha

3. Carbonfox
    - default

4. Nord
    - default

```lua
M.colorscheme = "rosepine"
M.variant = "moon"
```

## Features

### Lsp

Lsp support for the following languages

- C/C++
- Lua
- Rust
- Typescript
- Json
- Yaml
- CMake
- Css
- Docker
- Python
- Vimscript
- Svelte
- Toml
- Sql
- GLSL
- Tailwind
- Zig
- Gleam

### Dap

Debugging support for the following languages

- C++
- C
- Python
- Rust

## Plugins

### code-runner

+ [Civitasv/cmake-tools.nvim](https://dotfyle.com/plugins/Civitasv/cmake-tools.nvim)
### color

+ [brenoprata10/nvim-highlight-colors](https://dotfyle.com/plugins/brenoprata10/nvim-highlight-colors)
### colorscheme

+ [shaunsingh/nord.nvim](https://dotfyle.com/plugins/shaunsingh/nord.nvim)
+ [rose-pine/neovim](https://dotfyle.com/plugins/rose-pine/neovim)
+ [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)
+ [navarasu/onedark.nvim](https://dotfyle.com/plugins/navarasu/onedark.nvim)
+ [EdenEast/nightfox.nvim](https://dotfyle.com/plugins/EdenEast/nightfox.nvim)
### completion

+ [simrat39/rust-tools.nvim](https://dotfyle.com/plugins/simrat39/rust-tools.nvim)
+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
### cursorline

+ [RRethy/vim-illuminate](https://dotfyle.com/plugins/RRethy/vim-illuminate)
### debugging

+ [theHamsta/nvim-dap-virtual-text](https://dotfyle.com/plugins/theHamsta/nvim-dap-virtual-text)
+ [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
+ [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)
### dependency-management

+ [Saecki/crates.nvim](https://dotfyle.com/plugins/Saecki/crates.nvim)
### editing-support

+ [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
+ [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)
### file-explorer

+ [stevearc/oil.nvim](https://dotfyle.com/plugins/stevearc/oil.nvim)
### formatting

+ [mhartington/formatter.nvim](https://dotfyle.com/plugins/mhartington/formatter.nvim)
### fuzzy-finder

+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
### icon

+ [nvim-tree/nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)
### indent

+ [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)
### lsp

+ [b0o/SchemaStore.nvim](https://dotfyle.com/plugins/b0o/SchemaStore.nvim)
+ [p00f/clangd_extensions.nvim](https://dotfyle.com/plugins/p00f/clangd_extensions.nvim)
+ [mfussenegger/nvim-lint](https://dotfyle.com/plugins/mfussenegger/nvim-lint)
+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
### media

+ [andweeb/presence.nvim](https://dotfyle.com/plugins/andweeb/presence.nvim)
### nvim-dev

+ [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
+ [folke/neodev.nvim](https://dotfyle.com/plugins/folke/neodev.nvim)
### plugin-manager

+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
### startup

+ [startup-nvim/startup.nvim](https://dotfyle.com/plugins/startup-nvim/startup.nvim)
### statusline

+ [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)
### syntax

+ [echasnovski/mini.surround](https://dotfyle.com/plugins/echasnovski/mini.surround)
+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
### tmux

+ [aserowy/tmux.nvim](https://dotfyle.com/plugins/aserowy/tmux.nvim)
### utility

+ [mistricky/codesnap.nvim](https://dotfyle.com/plugins/mistricky/codesnap.nvim)
+ [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
+ [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)

## Work in progress

- Missing Keymaps
- Node debugging for Typescript
- OneDark colorscheme support
- Brew support
- cmake debugging support

## Acknowledgements

Part of this readme was generated by [Dotfyle](https://dotfyle.com)
