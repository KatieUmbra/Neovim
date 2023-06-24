local dap = require("dap")
local vim = vim

dap.adapters.python = function(cb, config)
	if config.request == "attach" then
		local port = (config.connect or config).port
		local host = (config.connect or config).host or '127.0.0.1'
		cb {
			type = "server",
			port = assert(port, '`connect.port` is required for a python `attach` configuration'),
			host = host,
			options = {
				source_filetype = "python"
			}
		}
	else
		cb {
			type = "executable",
			command = "/home/Katie/.virtualenvs/debugpy/bin/python",
			args = { "-m", "debugpy.adapter" },
			options = {
				source_filetype = "python"
			}
		}
	end
end

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch File",
		program = "${file}",
		console = "integratedTerminal",
		cwd = "${workspaceFolder}",
		args = function ()
			local argv = {}
			arg = vim.fn.input(string.format("Arguments: "))
			for a in string.gmatch(arg, "%S+") do
                table.insert(argv, a)
            end
            vim.cmd('echo ""')
            return argv
		end,
		pythonPath = function()
			local cwd = vim.fn.getcwd()
			if vim.fn.executable(cwd.."/venv/bin/python") == 1 then
				return cwd .. "/venv/bin/python"
			elseif vim.fn.executable(cwd.."/.venv/bin/python") == 1 then
				return cwd .. "/.venv/bin/python"
			else
				return "/usr/bin/python"
			end
		end,
	}
}
