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

set("<leader>ad", function() builtin.diagnostics(themes.ivy) end)
set("<leader>aa", function() vim.lsp.buf.code_action() end)
set("<leader>ar", function() vim.lsp.buf.rename() end)
set("<leader>ah", function() vim.lsp.buf.hover() end)
set("<leader>aD", function() builtin.lsp_definitions(themes.cursor) end)
set("<leader>ai", function() builtin.lsp_implementations(themes.cursor) end)
set("<leader>at", function() builtin.lsp_type_definitions(themes.cursor) end)
set("<leader>as", function() builtin.lsp_workspace_symbols(themes.dropdown) end)
