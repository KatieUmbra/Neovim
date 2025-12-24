--[[
-- File name: format.lua
-- Author: Katherine
-- Date created: 2025-12-23 19:31:52
-- Date modified: 2025-12-23 19:33:16
-- ===============
--]]

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
