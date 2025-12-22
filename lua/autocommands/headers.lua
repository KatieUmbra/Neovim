--[[
-- File name: headers.lua
-- Author: Katherine
-- Date created: 2025-12-18 17:51:43
-- Date modified: 2025-12-18 17:52:18
-- ===============
--]]

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("mygroup", { clear = true })

autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		local header = require("header")
		if header and header.update_date_modified then
			header.update_date_modified()
		else
			vim.notify_once("header.update_date_modified is not available", vim.log.levels.WARN)
		end
	end,
	group = "mygroup",
	desc = "Update header's date modified",
})

autocmd({ "BufNewFile", "BufReadPost" }, {
	pattern = "*",
	callback = function()
		local header = require("header")
		if not header then
			vim.notify_once(
				"Could not automatically add header to new file: header module couldn't be found",
				vim.log.levels.ERROR
			)
			return
		end

		local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
		local is_empty = #lines == 1 and lines[1] == ""

		if header.config.allow_autocmds and is_empty then
			local original_fmt = header.config.date_created_fmt
			local now = os.date(header.config.date_created_fmt, os.time())

			-- force add_headers to use the current datetime, otherwise it will show 1970-01-01
			header.config.date_created_fmt = now
			header.add_headers()

			header.config.date_created_fmt = original_fmt -- restore the original format
		end
	end,
	group = "mygroup",
	desc = "Add copyright header to new/empty files",
})
