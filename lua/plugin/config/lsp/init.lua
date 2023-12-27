local function lsp(name)
	return require("plugin.config.lsp." .. name)
end

lsp("general")

---@diagnostic disable-next-line: unused-local
local servers = {
	lua = "lua-language-server",
	json = "vscode-langservers-extracted => vscode-json-language-server",
	python = { "pip", "python-lsp-server" },
	yaml = "vscode-langservers-extracted => vscode-json-language-server",
	c = "clangd",
	docker_compose = { "npm", "@microsoft/compose-language-service" },
	docker = { "npm", "dockerfile-language-server-nodejs" },
	vimscript = { "npm", "vim-language-server" },
	cmake = { "cargo", "neocmakelsp" },
	glsl = "glsl_analyzer",
	toml = { "npm", "@taplo/cli" },
	svelte = { "npm", "svelte-language-server" },
	tailwindcss = { "npm", "@tailwindcss/language-server" },
	css = "vscode-langservers-extracted",
	rust = "rust-analyzer",
	typescript = "nodejs",
}
