require("cmake-tools").setup({
	cmake_command = "~/.local/cmake-3.28.0-rc2/bin/cmake",
	cmake_regenerate_on_save = true,
	cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
	cmake_build_directory = "build",

	cmake_dap_configuration = {
		name = "cpp",
		type = "codelldb",
		request = "launch",
		stopOnEntry = false,
		runInTerminal = true,
		console = "integratedTerminated",
	},

	cmake_executor = {
		name = "quickfix",
		opts = {},
		default_opts = {
			quickfix = {
				show = "always",
				position = "belowright",
				size = 10,
			},
			overseer = {
				new_task_opts = {},
				on_new_task = function(_) end,
			},
			terminal = {},
		},
	},
	cmake_terminal = {
		name = "terminal",
		opts = {
			name = "Main Terminal",
			prefix_name = "[CMakeTools]: ",
			split_direction = "horizontal",
			split_size = 11,

			single_terminal_per_instance = true,
			single_terminal_per_tab = true,
			keep_terminal_static_location = true,

			start_insert_in_launch_task = false,
			start_insert_in_other_tasks = false,
			focus_on_main_terminal = false,
			focus_on_launch_terminal = false,
		},
	},
	cmake_notifications = {
		enabled = true,
		spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
		refresh_rate_ms = 100,
	},
})
