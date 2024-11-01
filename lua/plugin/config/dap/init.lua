local dap = require("dap")
local dapui = require("dapui")
local daptext = require("nvim-dap-virtual-text")
local fun = vim.fn

local function adapter(name)
	return require("plugin.config.dap." .. name)
end

adapter("c_cpp")
adapter("rust")
adapter("python")
adapter("ui")
adapter("cmake")

fun.sign_define("DapBreakpoint", {
	text = "●",
	texthl = "",
	linehl = "debugBreakpoint",
	numhl = "debugBreakpoint",
})

fun.sign_define("DapBreakpointCondition", {
	text = "◆",
	texthl = "",
	linehl = "debugBreakpoint",
	numhl = "debugBreakpoint",
})

fun.sign_define("DapStopped", {
	text = "▶",
	texthl = "",
	linehl = "debugPC",
	numhl = "debugPC",
})

dap.defaults.fallback.force_external_terminal = true

daptext.setup({})

dapui.setup({
	layouts = {
		{
			elements = {
				{
					id = "watches",
					size = 0.33,
				},
				{
					id = "scopes",
					size = 0.33,
				},
				{
					id = "repl",
					size = 0.34,
				},
			},
			size = 40,
			position = "left",
		},
		{
			elements = {
				"console",
			},
			size = 0.25,
			position = "bottom",
		},
	},
	controls = {
		enabled = true,
		element = "repl",
		icons = {
			pause = "",
			play = "",
			step_into = "",
			step_over = "",
			step_out = "",
			step_back = "",
			run_last = "",
			terminate = "",
		},
	},
})

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = "/usr/bin/codelldb",
		args = { "--port", "${port}" },
	},
}
