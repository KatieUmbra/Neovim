#!/usr/bin/env bash

packages=(
    # Lsp
    "lua-language-server"
    "rust-analyzer"
    "glsl_analyzer-bin"
    "clang"
    "neocmakelsp-bin"
    "vscode-langservers-extracted"
    "dockerfile-language-server"
    "vim-language-server"
    "vtsls"
    "emmet-language-server"
    "svelte-language-server"
    "tailwindcss-language-server"
    "taplo-cli"
    "sql-language-server"
    "zls"
    "gleam"
    "ty"
    "odinls"
    "rhai-lsp-git"
    # Formatters
    "lua-format"
    "ruff"
    "python-gersemi"
    "prettierd"
    "sqruff-bin"
    "yamlfmt"
    "rustywind"
    # Nvim dependencies
    "tree-sitter-cli"
    "fd"
    "ripgrep"
    "git"
    )

var=$( IFS=$' '; echo "${packages[*]}" )

echo "Installing neovim plugins\n"

nvim --headless "+lua vim.pack.update()" +qa

echo "\nInstalling dependencies\n"

if [ -x "$(command -v yay)" ]
then
	echo "Found yay, using it."
	yay --needed --noconfirm -S $var
	exit 0
elif [ -x "$(command -v paru)" ]
then
	echo "Found paru, using it."
	paru --needed --noconfirm -S $var
	exit 0
else
	>&2 echo "No valid AUR helper found."
	exit 1
fi

