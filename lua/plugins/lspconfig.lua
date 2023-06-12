require("luasnip.loaders.from_vscode").lazy_load()

local lspconfig = require("lspconfig")
require("mason").setup()
local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities = vim.tbl_deep_extend(
	"force",
	lsp_defaults.capabilities,
	require("cmp_nvim_lsp").default_capabilities()
)

lspconfig.clangd.setup			{}
lspconfig.cmake.setup			{}
lspconfig.cssls.setup			{}
lspconfig.cssmodules_ls.setup	{}
lspconfig.docker_compose_language_service.setup {}
lspconfig.dockerls.setup		{}
lspconfig.jsonls.setup			{}
lspconfig.lua_ls.setup			{}
lspconfig.luau_lsp.setup		{}
lspconfig.omnisharp.setup		{}
lspconfig.pylyzer.setup			{}
lspconfig.pyright.setup			{}
lspconfig.pylsp.setup			{}
lspconfig.rust_analyzer.setup	{}
lspconfig.vimls.setup			{}
lspconfig.yamlls.setup			{}

vim.api.nvim_create_autocmd(
	"LspAttach", {
		desc = "LSP actions",
		callback = function()
			local bufmap = function(mode, lhs, rhs)
				local opts = {buffer = true}
				vim.keymap.set(mode, lhs, rhs, opts)
			end

			bufmap("n", "<C>mi",	"<cmd>lua vim.lsp.buf.hover()<CR>")
			bufmap("n", "<C-b>",	"<cmd>lua vim.lsp.buf.definition()<CR>")
			bufmap("n", "<C-S-B>",	"<cmd>lua vim.lsp.buf.declaration()<CR>")
			bufmap("n", "<F31>",	"<cmd>lua vim.lsp.buf.implementation()<CR>")
			bufmap("n", "<C>go",	"<cmd>lua vim.lsp.buf.type_definition()<CR>")
			bufmap("n", "<C>gr",	"<cmd>lua vim.lsp.buf.references()<CR>")
			bufmap("n", "<C>gs",	"<cmd>lua vim.lsp.buf.signature_help()<CR>")
			bufmap("n", "<F30>",	"<cmd>lua vim.lsp.buf.rename()<CR>")
			bufmap("n", "<F4>",		"<cmd>lua vim.lsp.buf.code_action()<CR>")
			bufmap("x", "<F4>",		"<cmd>lua vim.lsp.buf.range_code_action()<CR>")
			bufmap("n", "<C>gl",	"<cmd>lua vim.diagnostic.open_float()<CR>")
			bufmap("n", "<C>[d",	"<cmd>lua vim.diagnostic.goto_prev()<CR>")
			bufmap("n", "<C>]d",	"<cmd>lua vim.diagnostic.goto_next()<CR>")
		end
	}
)
