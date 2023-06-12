local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")
	local set = vim.keymap.set

	local function opts(desc)
		return {
			desc = "nvim-tree: " .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true
		}
	end

	api.config.mappings.default_on_attach(bufnr)

	set("n", "<C-o>",	api.tree.change_root_to_parent,	opts("Up"))
	set("n", "<C-CR>",	api.tree.change_root_to_node,	opts("Here"))
	set("n", "<CR>",	api.node.open.edit,				opts("Open"))
	set("n", "<C-c>",	api.fs.copy.node,				opts("Copy"))
	set("n", "<C-d>",	api.fs.remove,					opts("Remove"))
	set("n", "<C-v>",	api.fs.paste,					opts("Paste"))
	set("n", "<C-x>",	api.fs.cut,						opts("Cut"))
	set("n", "<C-r>",	api.fs.rename,					opts("Rename"))
	set("n", "<C-R>",	api.tree.reload,				opts("Reload"))
end

require("nvim-tree").setup {
	on_attach = my_on_attach,
	sort_by = "case_sensitive",
	view = {
		width = 20
	},
	renderer = {
		group_empty = true
	},
	filters = {
		dotfiles = true
	}
}
