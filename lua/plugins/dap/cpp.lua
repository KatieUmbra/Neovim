local dap = require("dap")
local vim = vim

local function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

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
		name = "Launch C++",
		type = "codelldb",
		request = "launch",
		program = function()
		local is_using_cmake = file_exists("CMakeLists.txt")
		if is_using_cmake then
			local test = ""
			vim.ui.input({prompt="Debug Tests? (Y/N): "}, function(str)
				test = str
			end)
			local command = "find ! -type d -path './build/bin/*' | grep -v 'Test' | sed 's#.*/##'"
			local resultFile = io.popen(command, "r")
			local result = ""
			if (resultFile ~= nil) then
				result = resultFile:read("*a")
				resultFile:close()
			end
			local bin = "build/bin/" .. result:gsub("[\n\r]", "");
			os.execute("cmake --build build --config Debug >> /dev/null")
			if (test == "y") then
				return "build/bin/Test"
			else
				return bin
			end
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
