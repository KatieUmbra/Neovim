local dap = require("dap")
local vim = vim

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
		local using_cmake = vim.fn.input(string.format("Debug CMake?(yes/no): "))
		local is_using_cmake = string.upper(using_cmake) == "YES" or string.upper(using_cmake) == "Y"
		if is_using_cmake then
			os.execute("rm build/bin-name")
			os.execute("find build -maxdepth 1 -type f ! -size 0 -exec grep -IL build '{}' \\; >> build/bin-name")
			local f = assert(io.open("build/bin-name", "r"))
			local line = f:read("a")
			local bin = string.gsub(line, "[\t\n]", "")
			os.execute("make -C build >> /dev/null")
			return bin
		else
			local filetype = vim.bo.filetype
			local filename = vim.fn.expand("%")
			local basename = vim.fn.expand("%:t:r")
			if filetype == "c" then
				os.execute(string.format("clang -g -o %s %s", basename, filename))
			else
				os.execute(string.format("clang++ -g -o %s %s", basename, filename))
			end
			return basename
		end
		end,
		args = function ()
			local argv = {}
			arg = vim.fn.input(string.format("Arguments: "))
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
