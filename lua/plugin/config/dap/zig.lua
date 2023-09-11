local dap = require("dap")

dap.configurations.zig = {
	{
		name = "Zig Run",
		type = "codelldb",
		request = "launch",
		program = function()
			os.execute("zig build")
			local command = "find ! -type d -path './zig-out/bin/*' | grep -v 'Test' | sed 's#.*/##'"
			local bin_location = io.popen(command, "r")
			if (bin_location ~= nil) then
				return "zig-out/bin/"..bin_location:read("*a"):gsub("[\n\r]", "")
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
            return argv
		end
	}
}
