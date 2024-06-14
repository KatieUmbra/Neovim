local builtin = require("telescope.builtin")
local defaults = { silent = true, noremap = true }
local function set(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, defaults)
end

local themes = require("options.telescope_theme").themes

set("<leader>ad", function()
	builtin.diagnostics(themes.ivy)
end)
set("<leader>aa", function()
	vim.lsp.buf.code_action()
end)
set("<leader>ar", function()
	vim.lsp.buf.rename()
end)
set("<leader>ah", function()
	vim.lsp.buf.hover()
end)
set("<leader>aD", builtin.lsp_definitions)
set("<leader>ai", builtin.lsp_implementations)
set("<leader>at", builtin.lsp_type_definitions)
set("<leader>as", builtin.lsp_workspace_symbols)
set("<leader>ae", vim.diagnostic.open_float)
