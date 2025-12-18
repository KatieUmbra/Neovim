require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()

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
		init = function()
			require("clangd_extensions").setup(require("plugin.config.lsp.clangd"))
			vim.lsp.inlay_hint.enable()
		end,
	},
	["docker compose"] = {
		lsp = "docker_compose_language_service",
	},
	["docker"] = {
		lsp = "dockerls",
	},
	["vim"] = {
		lsp = "vimls",
	},
	["cmake"] = {
		lsp = "neocmake",
	},
	["glsl"] = {
		lsp = "glsl_analyzer",
	},
	["toml"] = {
		lsp = "taplo",
	},
	["svelte"] = {
		lsp = "svelte",
	},
	["tailwind"] = {
		lsp = "tailwindcss",
	},
	["css"] = {
		lsp = "cssls",
		config = { capabilities = capabilities },
	},
	["zig"] = {
		lsp = "zls",
	},
	["rust"] = {
		init = function()
			require("rust-tools").setup({})
			require("crates").setup({})
		end,
	},
	["sql"] = {
		lsp = "sqlls",
	},
	["gleam"] = {
		lsp = "gleam",
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
	if lsp.lsp ~= nil then
		vim.lsp.enable(lsp.lsp)
		if lsp.config ~= nil then
			vim.lsp.config(lsp.lsp, lsp.config)
		end
		if lsp.init ~= nil then
			lsp.init()
		end
	end
end
