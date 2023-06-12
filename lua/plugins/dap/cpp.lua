local dap = require("dap")

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = "/usr/bin/codelldb",
		args = { "--port", "${port}" }
	}
}

dap.configurations.cpp = {
	{
		type = "codelldb",
		request = "launch",
		program = function()
			local filetype = vim.bo.filetype
			local filename = vim.fn.expand("%")
			local basename = vim.fn.expand("%:t:r")
			local makefile = os.execute("(ls | grep -i makefile)")
			if makefile == "makefile" or makefile == "Makefile" then
				os.execute("make debug")
			else
				if filetype == "c" then
					os.execute(string.format("gcc -g -o %s %s", basename, filename))
				else
					os.execute(string.format("g++ -g -o %s %s", basename, filename))
				end
			end
			return basename
		end,
		args = function ()
			local argv = {}
			arg = vim.fn.input(string.format("argv: "))
            for a in string.gmatch(arg, "%S+") do
                table.insert(argv, a)
            end
            vim.cmd('echo ""')
            return argv
		end,
		cwd = "${workspaceFolder}",
		MIMode = "gdb",
		miDebuggerPath = "/usr/bin/gdb",
		setupCommands = {
			{
				text = "-enable-pretty-printing",
                description = "enable pretty printing",
                ignoreFailures = false
			}
		}
	}
}

dap.configurations.c = dap.configurations.cpp
