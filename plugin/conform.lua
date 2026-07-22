Plugins.add({
    name = "conform",
    src = "https://github.com/stevearc/conform.nvim"
})

vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() }
        }
    end
    require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(ev)
        local bufnr = ev.buf
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
        end
        require("conform").format({
            lsp_format = "fallback",
            bufnr = bufnr
        })
        if require("options.general").format_notificaion then
            vim.notify("Formatted using conform (Run :FormatDisable to disable)")
        end
    end
})

vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
    else
        vim.g.disable_autoformat = true
    end
end, {
    desc = "Disable autoformat-on-save",
    bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
end, {
    desc = "Re-enable autoformat-on-save",
})
