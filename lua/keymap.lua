-- [[ -- SET MAPPING -- ]]
local vim = vim
local set = vim.keymap.set
local defaults = {silent = true, nowait = true}
local defaults_debug = {silent = true, noremap = true}
local disable = {silent = true, noremap = true}

-- [[ Neo Tree ]]
set("n", "<A-1>", ":NeoTreeShowToggle filesystem<CR>", defaults)
set("n", "<A-0>", ":NeoTreeShowToggle git_status<CR>", defaults)
set("n", "<A-2>", ":NeoTreeShowToggle buffers<CR>", defaults)
set("n", "<A-3>", ":NeoTreeShowToggle document_symbols<CR>", defaults)
set("n", "<leader>nt", ":NeoTreeFocus<CR>", {silent = true})

-- [[ Disable Arrow Keys ]]
set("n", "<Right>", ":echoe 'Use [L]'<CR>", disable)
set("n", "<Left>", ":echoe 'Use [H]'<CR>", disable)
set("n", "<Up>", ":echoe 'Use [K]'<CR>", disable)
set("n", "<Down>", ":echoe 'Use [J]'<CR>", disable)

-- [[ Color Picker ]]

set("n", "<C-c>", ":CccPick<CR>", defaults_debug)

-- [[ Debugger ]]
local dap = require("dap")
local dapui = require("dapui")

set("n","<F5>",
	function()
		dap.continue()
		dapui.open()
	end, defaults_debug,
set("n","<F12>",
	function()
		dap.terminate()
		dapui.close()
		vim.cmd("sleep 50ms")
		dap.repl.close()
	end, defaults_debug),
set("n","<S-F5>",
	function()
		dap.terminate()
		vim.cmd("sleep 50ms")
		dap.repl.close()
		dap.continue()
	end, defaults_debug),
set("n","<leader>B",
	function()
		dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
	end, defaults_debug),
set("n","<F8>",
	function()
		dap.toggle_breakpoint()
	end, defaults_debug),
set("n","<F20>",
	function()
		dap.clear_breakpoints()
	end, defaults_debug),
set("n","<F10>",
	function()
		dap.step_over()
	end, defaults_debug),
set("n", "<F11>",
	function()
		dap.step_into()
	end, defaults_debug),
set("n", "<F23>",
	function()
		dap.step_out()
	end, defaults_debug),
set("n", "<leader>dp",
	function()
		dap.pause()
	end, defaults_debug),
set("n", "<leader>rc",
	function()
		dap.run_to_cursor()
	end), defaults_debug)
