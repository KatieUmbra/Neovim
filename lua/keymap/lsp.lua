local builtin = require("telescope.builtin")
local defaults = { silent = true, noremap = true }
local function set(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, defaults)
end

local themes = {
	cursor = require("telescope.themes").get_cursor({}),
	dropdown = require("telescope.themes").get_dropdown({}),
	ivy = require("telescope.themes").get_ivy({})
}

set("<A-]>", function() builtin.diagnostics(themes.ivy) end)
set("<A-CR>", function() vim.lsp.buf.code_action() end)
set("<F18>", function() vim.lsp.buf.rename() end)
set("K", function() vim.lsp.buf.hover() end)
set("<C-b>", function() builtin.lsp_definitions(themes.cursor) end)
set("<C-n>", function() builtin.lsp_implementations(themes.cursor) end)
set("<F7>", function() builtin.lsp_type_definitions(themes.cursor) end)
set("<A-2>", function() builtin.lsp_workspace_symbols(themes.dropdown) end)
