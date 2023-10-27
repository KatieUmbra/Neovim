local cmake = require("cmake-tools")
local defaults = { silent = true, noremap = true }
local function set(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, defaults)
end

set("<leader>cs", cmake.select_build_type)
set("<leader>cS", cmake.select_configure_preset)
set("<leader>cb", cmake.build)
set("<leader>ct", cmake.select_build_target)
set("<leader>cd", cmake.debug)
set("<leader>cr", cmake.run)
set("<leader>cl", cmake.select_launch_target)
