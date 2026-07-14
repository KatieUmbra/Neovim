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
--	lua => lua-language-server
--	rust => rust-analyzer
--	glsl => glsl_analyzer-bin
--	c => clang
--	cmake => neocmakelsp-bin
--	yaml, json => vscode-langservers-extracted
--	docker => dockerfile-language-server
--	vim => vim-language-server
--	svelte => svelte-language-server
--	tailwind => tailwindcss-language-server
--	toml => taplo-cli
--	sql => sql-language-server
--	zig => zls
--	gleam => gleam
--	python => ty
--	odin => odinls
--]]
M.language_servers = {
	"lua",
	"json",
	"python",
	"yaml",
	"c",
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
	"odin",
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
M.colorscheme = "nord"
-- {# replace_in(`"`, data.color.variant) #}
M.variant = "default"
return M
