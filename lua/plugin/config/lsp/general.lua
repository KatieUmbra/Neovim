require("luasnip.loaders.from_vscode").lazy_load()
local lspconfig = require("lspconfig")
local configurations = require("lspconfig.configs")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities =
	vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})
lspconfig.jsonls.setup({
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
	capabilities = capabilities,
})
lspconfig.pylsp.setup({
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "W391" },
					maxLineLength = 100,
				},
			},
		},
	},
})
lspconfig.mojo.setup({
	filetypes = { "mojo", "🔥" },
})
lspconfig.yamlls.setup({
	settings = {
		yaml = {
			schemaStore = {
				enable = false,
				url = "",
			},
			schemas = require("schemastore").yaml.schemas(),
		},
	},
})
lspconfig.clangd.setup({
	on_attach = function()
		require("clangd_extensions.inlay_hints").setup_autocmd()
		require("clangd_extensions.inlay_hints").set_inlay_hints()
	end,
})

lspconfig.docker_compose_language_service.setup({})
lspconfig.dockerls.setup({})

lspconfig.vimls.setup({})

lspconfig.neocmake.setup({})
lspconfig.zls.setup({})
lspconfig.csharp_ls.setup({})
lspconfig.glsl_analyzer.setup({})

lspconfig.taplo.setup({})

lspconfig.svelte.setup({})
lspconfig.tailwindcss.setup({})
lspconfig.cssls.setup({ capabilities = capabilities })
