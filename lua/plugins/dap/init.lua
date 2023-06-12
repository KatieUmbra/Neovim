require("plugins.dap.cpp")
require("plugins.dap.rust")

local vim = vim
local dap = require("dap")
local dapui = require("dapui")
local daptext = require("nvim-dap-virtual-text")

local fun = vim.fn

fun.sign_define (
	"DapBreakpoint",
	{
		text =		"●",
		texthl =	"",
		linehl =	"debugBreakpoint",
		numhl =		"debugBreakpoint"
	}
)

fun.sign_define (
	"DapBreakpointCondition",
	{
		text =		"◆",
		texthl =	"",
		linehl =	"debugBreakpoint",
		numhl =		"debugBreakpoint"
	}
)

fun.sign_define (
	"DapStopped",
	{
		text = "▶",
		texthl = "",
		linehl = "debugPC",
		numhl = "debugPC"
	}
)

dap.defaults.fallback.force_external_terminal = true
daptext.setup()
dapui.setup {
	layouts = {
		{
			elements = {
				"console"
			},
			size = 0.25,
			position = "Bottom"
		},
		{
			elements = {
				"Watches",
				{
					id = "scopes",
					size = 0.5
				},
				{
					id = "repl",
					size = 0.15
				}
			},
			size = 40,
			position = "left"
		}
	},
	controls = {
		enabled = true,
		element = "repl",
		icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "↻",
            terminate = "□",
        }
	}
}
