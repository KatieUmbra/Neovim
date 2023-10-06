local function lsp(name)
	return require("plugin.config.lsp."..name)
end

lsp("neodev")
lsp("general")
lsp("rust")
lsp("typescript")
lsp("clangd")

---@diagnostic disable-next-line: unused-local
local servers = {
	lua = "lua-language-server",
	rust = "rust-analyzer",
	typescript = "nodejs",
	json = "vscode-langservers-extracted => vscode-json-language-server",
	zig = "zls",
	cmake = { "cargo", "neocmakelsp" },
	css = "vscode-langservers-extracted",
	docker_compose = { "npm", "@microsoft/compose-language-service" },
	docker = { "npm", "dockerfile-language-server-nodejs" },
	python = { "pip", "python-lsp-server" },
	yaml = "vscode-langservers-extracted => vscode-json-language-server",
	vimscript = { "npm", "vim-language-server" },
	svelte = { "npm", "svelte-language-server" },
	tailwindcss = { "npm", "@tailwindcss/language-server" },
	toml = { "npm", "@taplo/cli" },
	csharp = "omnisharp-roslyn"
}
