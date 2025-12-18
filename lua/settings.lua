local M = {}
--[[
-- ===========================
--    Language Server List
-- ===========================
--
-- Guide for manual enabling of language servers.
-- PREFERRED WAY TO INSTALL LANGUAGE SERVERS IS VIA THE INSTALL SCRIPT
-- add the elements before the arrow `=>` inside `M.language_servers`
-- the text after the arrow is the exact name of the package to install
--
--  yay:
--  lua => lua-language-server
--  rust => rust-analyzer
--  glsl => glsl_analyzer
--  c => clangd
--  zig => zls
--  gleam => gleam
--
--  cargo:
--  cmake => neocmakelsp
--
--  npm:
--  yaml, json => vscode-langservers-extracted
--  docker compose => @microsoft/compose-language-service
--  docker => dockerfile-language-server-nodejs
--  vim => vim-language-server
--  svelte => svelte-language-server
--  tailwind => @tailwindcss/language-server
--  toml => @taplo/cli
--  sql => sql-language-server
--
--  pip:
--  python => python-lsp-server
--]]
M.language_servers = {
	"lua",
	"json",
	"python",
	"yaml",
	"c",
	"docker compose",
	"docker",
	"vim",
	"cmake",
	"glsl",
	"toml",
	"svelte",
	"tailwind",
	"css",
	"rust",
	"sql",
	"typescript",
	"zig",
	"gleam",
}

--[[
-- ===========================
--			  Color
-- ===========================
-- Available colorschemes for delimiters and indentation
--
-- - rosepine
-- - catpuccin
-- - nord
-- - carbonfox
--]]

-- {# replace_in(`"`, data.color.name) #}
M.colorscheme = "rosepine"
-- {# replace_in(`"`, data.color.variant) #}
M.variant = "moon"
return M
