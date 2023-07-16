require("luasnip.loaders.from_vscode").lazy_load()

local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities = vim.tbl_deep_extend(
	"force",
	lsp_defaults.capabilities,
	require("cmp_nvim_lsp").default_capabilities()
)

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
lspconfig.vimls.setup			{}
lspconfig.yamlls.setup			{}
