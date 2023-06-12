-- [[ -- SET MAPPING -- ]]
local set = vim.keymap.set
local defaults = {silent = true, noremap = true, expr = true, replace_keycodes = false}

-- [[ Nvim Tree ]]
-- Look -> plugins/nvimtree.lua
set("n", "<A-1>", ":NvimTreeToggle<CR>")

-- [[ Debugger ]]
local dap = require("dap")
local dapui = require("dapui")

set("n","<F5>",
	function()
		dap.continue()
		dapui.open()
	end, {silent = true, noremap = true, expr = false},
set("n","<F12>",
	function() 
		dap.terminate()
		dapui.close()
		vim.cmd("sleep 50ms")
		dap.repl.close()
	end, {silent = true, noremap = true, expr = false}),
set("n","<S-F5>", 
	function()
		dap.terminate()
		vim.cmd("sleep 50ms")
		dap.repl.close()
		dap.continue()
	end, defaults),
set("n","<leader>B",
	function()
		dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
	end, defaults),
set("n","<F8>", 
	function()
		dap.toggle_breakpoint()
	end, defaults),
set("n","<F20>", 
	function()
		dap.clear_breakpoints()
	end, defaults),
set("n","<F10>", 
	function()
		dap.step_over()
	end, defaults),
set("n", "<F11>", 
	function()
		dap.step_into()
	end, defaults),
set("n", "<F23>", 
	function()
		dap.step_out()
	end),
set("n", "<leader>dp", 
	function()
		dap.pause()
	end),
set("n", "<leader>rc", 
	function()
		dap.run_to_cursor()
	end))
