--[[
-- special case for the lua_ls language server so it ALWAYS starts AFTER Lazydev
--]]--

vim.pack.add({ { src = "https://github.com/folke/lazydev.nvim", name = "lazydev" } })
require("lazydev").setup({})
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function ()
        vim.lsp.enable({ "lua_ls" })
    end
})
