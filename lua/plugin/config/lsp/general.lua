local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()

local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities =
	vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

require("neodev").setup({})

local configs = {
	["lua"] = {
		lsp = "lua_ls",
		config = {
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		},
	},
	["json"] = {
		lsp = "lua_ls",
		config = {
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
			capabilities = capabilities,
		},
	},
	["python"] = {
		lsp = "pylsp",
		config = {
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
		},
	},
	["yaml"] = {
		lsp = "yamlls",
		config = {
			settings = {
				yaml = {
					schemaStore = {
						enable = false,
						url = "",
					},
					schemas = require("schemastore").yaml.schemas(),
				},
			},
		},
	},
	["c"] = {
		lsp = "clangd",
		config = {
			on_attach = function()
				require("clangd_extensions.inlay_hints").setup_autocmd()
				require("clangd_extensions.inlay_hints").set_inlay_hints()
			end,
		},
		init = function()
			require("clangd_extensions").setup(require("plugin.config.lsp.clangd"))
		end,
	},
	["docker compose"] = {
		lsp = "docker_compose_language_service",
		config = {},
	},
	["docker"] = {
		lsp = "dockerls",
		config = {},
	},
	["vim"] = {
		lsp = "vimls",
		config = {},
	},
	["cmake"] = {
		lsp = "neocmake",
		config = {},
	},
	["glsl"] = {
		lsp = "glsl_analyzer",
		config = {},
	},
	["toml"] = {
		lsp = "taplo",
		config = {},
	},
	["svelte"] = {
		lsp = "svelte",
		config = {},
	},
	["tailwind"] = {
		lsp = "tailwindcss",
		config = {},
	},
	["css"] = {
		lsp = "cssls",
		config = { capabilities = capabilities },
	},
	["rust"] = {
		init = function()
			require("rust-tools").setup({})
			require("crates").setup({})
		end,
	},
	["typescript"] = {
		init = function()
			require("typescript-tools").setup({})
		end,
	},
}

local settings = require("settings")
for _, i in ipairs(settings.language_servers) do
	local lsp = configs[i]
	if lsp.config ~= nil and lsp.lsp ~= nil then
		lspconfig[lsp.lsp].setup(lsp.config)
	else
		lsp.init()
	end
end
