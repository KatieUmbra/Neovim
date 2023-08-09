-- [[ -- SET MAPPING -- ]]
local set = vim.keymap.set
local defaults_nt = {silent = true, nowait = true}
local defaults = {silent = true, noremap = true}

-- [[ Neo Tree ]]
set("n", "<A-1>", ":NeoTreeShowToggle filesystem<CR>", defaults_nt)
set("n", "<A-0>", ":NeoTreeShowToggle git_status<CR>", defaults_nt)
set("n", "<A-2>", ":NeoTreeShowToggle buffers<CR>", defaults_nt)
set("n", "<A-3>", ":NeoTreeShowToggle document_symbols<CR>", defaults_nt)
set("n", "ft", ":NeoTreeFocus<CR>", {silent = true})

-- [[ Disable Arrow Keys ]]
set("n", "<Right>", ":echoe 'Use [L]'<CR>", defaults)
set("n", "<Left>", ":echoe 'Use [H]'<CR>", defaults)
set("n", "<Up>", ":echoe 'Use [K]'<CR>", defaults)
set("n", "<Down>", ":echoe 'Use [J]'<CR>", defaults)

-- [[ Color Picker ]]
set("n", "<C-c>", ":CccPick<CR>", defaults)

-- [[ Telescope ]]
local builtin = require("telescope.builtin")
set("n", "<leader>ff",	builtin.find_files,		defaults)
set("n", "<leader>f",	builtin.live_grep,		defaults)
set("n", "<leader>fb",	builtin.buffers,		defaults)
set("n", "<leader>ft",	builtin.treesitter,		defaults)
set("n", "<leader>fx",	builtin.diagnostics,	defaults)
set("n", "<leader>fg",	builtin.git_status,		defaults)

-- [[ Terminal ]]
set("n", "<F60>", ":ToggleTerm<CR>", defaults)

-- [[ Tasks ]]
set("n", "<F17>", ":Telescope toggletasks spawn<CR>",	defaults)
set("n", "<F19>", ":Telescope toggletasks select<CR>",	defaults)

-- [[ Diagnostics ]]
set("n", "<A-]>", ":TroubleToggle workspace_diagnostics<CR>", defaults)

-- [[ Zen Mode ]]
set("n", "<A-z>", ":TZAtaraxis<CR>", defaults)

-- [[ Clangd Extensions ]]
set("n", "<leader>if", ":ClangdSymbolInfo<CR>", defaults)
set("n", "as", ":ClangdAST<CR>")

-- [[ ================== ]]
-- [[ Custom Keybindings ]]
-- [[ ================== ]]

set("n", "<C-y>", function ()
	vim.api.nvim_del_current_line()
end, defaults)

set("n", "dd", function ()
	vim.api.nvim_del_current_line()
end, defaults)

set("n", "<C-d>", "yyp", defaults)

-- [[ ================== ]]

-- [[ Lsp Actions ]]
local actions = require("lspactions")
set("n", "<F18>",
	function ()
		actions.rename()
	end, defaults)
set("n", "<C-b>",
	function ()
		actions.definition()
	end)
set("n", "<F7>",
	function ()
		actions.implementation()
	end)
set("n", "<A-CR>", ":lua require'lspactions'.code_action()<CR>", defaults)

-- [[ Debugger ]]
---@diagnostic disable-next-line: different-requires
local dap = require("dap")
local dapui = require("dapui")

set("n","<F5>",
	function()
		dap.continue()
		dapui.open()
	end, defaults)
set("n","<F12>",
	function()
		dap.terminate()
		dapui.close()
		vim.cmd("sleep 50ms")
		dap.repl.close()
	end, defaults)
set("n","<S-F5>",
	function()
		dap.terminate()
		vim.cmd("sleep 50ms")
		dap.repl.close()
		dap.continue()
	end, defaults)
set("n","<leader>B",
	function()
		dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
	end, defaults)
set("n","<F8>",
	function()
		dap.toggle_breakpoint()
	end, defaults)
set("n","<F20>",
	function()
		dap.clear_breakpoints()
	end, defaults)
set("n","<F10>",
	function()
		dap.step_over()
	end, defaults)
set("n", "<F11>",
	function()
		dap.step_into()
	end, defaults)
set("n", "<F23>",
	function()
		dap.step_out()
	end, defaults)
set("n", "<leader>dp",
	function()
		dap.pause()
	end, defaults)
set("n", "<leader>rc",
	function()
		dap.run_to_cursor()
	end, defaults)
