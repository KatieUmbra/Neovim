vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.pack.add({ 'https://github.com/saghen/blink.lib', 'https://github.com/saghen/blink.cmp' })
        local cmp = require('blink.cmp')
        cmp.build():pwait()
        cmp.setup({
            completion = {
                menu = {
                    winblend = 0,
                    border = "single"
                },
                accept = { auto_brackets = { enabled = true } },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 250,
                    treesitter_highlighting = true,
                    window = { border = "single", winblend = 0 }
                }
            },
            sources = {
                default = { "lazydev", "lsp", "path", "snippets", "buffer" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100
                    }
                }
            },
            keymap = {
                ["<CR>"] = { "accept", "fallback" },
            },
            snippets = {
                preset = "mini_snippets"
            }
        })
    end
})
