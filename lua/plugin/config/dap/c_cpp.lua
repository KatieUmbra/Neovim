local dap = require("dap")

dap.configurations.cpp = {
	{
		name = "C++/C with CMake",
		type = "codelldb",
		request = "launch",
		program = function()
			local command = "find ! -type d -path './build/bin/*' | grep -v 'Test' | sed 's#.*/##'"
			local bin_location = io.popen(command, "r")
			if (bin_location ~= nil) then
				return "build/bin/"..bin_location:read("*a"):gsub("[\n\r]", "")
			else
				return ""
			end
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = function ()
			local argv = {}
			arg = vim.fn.input(string.format("Arguments: "))
            for a in string.gmatch(arg, "%S+") do
                table.insert(argv, a)
            end
            vim.cmd('echo ""')
            return argv
		end
	},
	{
		name = "C++/C Tests with CMake",
		type = "codelldb",
		request = "launch",
		program = "build/bin/Test",
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = function ()
			local argv = {}
			arg = vim.fn.input(string.format("Arguments: "))
            for a in string.gmatch(arg, "%S+") do
                table.insert(argv, a)
            end
            vim.cmd('echo ""')
            return argv
		end
	},
	{
		name = "C++/C File",
		type = "codelldb",
		request = "launch",
		program = function()
			local filetype = vim.bo.filetype
			local filename = vim.fn.expand("%")
			local basename = vim.fn.expand("%:t:r")
			if filetype == "c" then
				os.execute(string.format("clang -g -o %s %s", basename, filename))
			else
				os.execute(string.format("clang++ -g -o %s %s", basename, filename))
			end
			return basename
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = function ()
			local argv = {}
			arg = vim.fn.input(string.format("Arguments: "))
            for a in string.gmatch(arg, "%S+") do
                table.insert(argv, a)
            end
            vim.cmd('echo ""')
            return argv
		end
	}
}

dap.configurations.c = dap.configurations.cpp
