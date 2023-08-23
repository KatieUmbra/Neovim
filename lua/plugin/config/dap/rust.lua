local dap = require("dap")

dap.configurations.rust = {
	{
		name = "Rust",
		type = "codelldb",
		request = "launch",
		program = function()
			os.execute("cargo build >> /dev/null")
			return "target/debug/${workspaceFolderBasename}"
		end,
		args = function()
			local argv = {}
			arg = vim.fn.input(string.format("Arguments: "))
			for i in string.gmatch(arg, "%S+") do
				table.insert(argv, i)
			end
			return argv
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false
	}
}
