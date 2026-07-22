Plugins.add({
    name = "lspconfig",
    src = "https://github.com/neovim/nvim-lspconfig",
    load = function()
        require("plugutil.setup_languages")
    end,
    no_opts = true,
    sync = true
})

Plugins.add({
    name = "rustaceanvim",
    src = "https://github.com/mrcjkb/rustaceanvim",
    no_opts = true,
    packopts = { version = vim.version.range("^9") }
})

Plugins.add({
    name = "crates",
    src = "https://github.com/saecki/crates.nvim",
    packopts = { tag = "stable" },
})

vim.api.nvim_create_user_command("LspInfo", [[ checkhealth vim.lsp ]], { desc = "Alias for checkhealth vim.lsp" })
