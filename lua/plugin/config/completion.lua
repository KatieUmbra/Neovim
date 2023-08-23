local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local luasnip = require('luasnip')
local selectOptions = { behavior = cmp.SelectBehavior.Select }
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	sources = {
		{name = "path"},
		{name = "nvim_lsp" },
		{name = "buffer" },
		{name = "luasnip" },
		{name = "crates"},
		{name = ""}

	},
	formatting = {
		fields = {'menu', 'abbr', 'kind'},
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = '󰊕',
				luasnip = '',
				buffer = '',
				path = '',
			}
			item.menu = menu_icon[entry.source.name]
			return item
		end
	},
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.recently_used,
			require("clangd_extensions.cmp_scores"),
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	window = {
		documentation 	= cmp.config.window.bordered(),
		completion 	= cmp.config.window.bordered()
	},
	mapping = {
		['<CR>'] = cmp.mapping.confirm({select = false}),
		['<Up>'] = cmp.mapping.select_prev_item(selectOptions),
		['<Down>'] = cmp.mapping.select_next_item(selectOptions),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-y>'] = cmp.mapping.confirm({select = true}),
		['<Tab>'] = cmp.mapping(function(fallback)
			local col = vim.fn.col('.') - 1

			if cmp.visible() then
				cmp.select_next_item(selectOptions)
			elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
				fallback()
			else
				cmp.complete()
			end
		end, {'i', 's'}),
	},
}

cmp.setup.filetype({"dap-repl", "dapui_watches", "dapui_hover"}, {
	sources = {
		{name = "dap"}
	}
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({}))
