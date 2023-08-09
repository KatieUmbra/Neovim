local dap = require("dap")

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = "/home/Katie/.local/bin/cpptools/debugAdapters/bin/OpenDebugAD7"
}

dap.configurations.zig = {
	{
		name = "Launch File",
		type = "cppdbg",
		request = "launch",
		program = function()
			local command = "find ! -type d -path './zig-out/bin/*' | grep -v 'Test' | sed 's#.*/##'"
			local resultFile = io.popen(command, "r")
			local result = ""
			if (resultFile ~= nil) then
				result = resultFile:read("*a")
				resultFile:close()
			end
			local bin = "zig-out/bin/" .. result:gsub("[\n\r]", "");
			os.execute("zig build")
			return bin
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
		setupCommands = {
			text = "-enable-pretty-printing",
			description = "Enable Pretty Printing for gdb",
			ignoreFailers = true
		}
	}
}
