vim.lsp.config["rhai-lsp"] = {
    cmd = { "rhai-lsp", "lsp", "stdio" },
    filetypes = { "rhai" },
    root_markers = { { ".rhai" }, ".git" },
    settings = {}
}

vim.filetype.add({
    extension = {
        rhai = "rhai"
    }
})

vim.lsp.enable("rhai-lsp")
