local dap = require("dap")
local defaults = { noremap = true, silent = true, nowait = true }
local function key(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, defaults)
end

key("<leader>ds", function() dap.continue() end)
key("<leader>dS", function()
	dap.repl.close()
	dap.terminate()
end)
key("<leader>dr", function()
	dap.rep.close()
	dap.terminate()
	dap.continue()
end)
key("<leader>db", function() dap.toggle_breakpoint() end)
key("<leader>dc", function() dap.clear_breakpoints() end)
key("<leader>dn", function() dap.step_over() end)
key("<leader>di", function() dap.step_into() end)
key("<leader>do", function() dap.step_out() end)
key("<leader>dp", function() dap.pause() end)
key("<leader>dh", function() dap.run_to_cursor() end)

