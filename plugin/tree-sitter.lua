Plugins.add({
    name = "nvim-treesitter",
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    packopts = {
        branch = "main",
        build = ":TSUpdate"
    },
    load = function(args)
        require("nvim-treesitter").install({
            -- Programming Languages
            "c",
            "cpp",
            "lua",
            "vim",
            "rust",
            "python",
            "cmake",
            "css",
            "scss",
            "sql",
            "typescript",
            "javascript",
            "svelte",
            "glsl",
            "gleam",
            "zig",
            "odin",
            -- Object notation / Markup
            "toml",
            "yaml",
            "json",
            "yuck",
            "markdown",
            "markdown_inline",
            -- Documentation
            "luadoc",
            "vimdoc",
            "javadoc",
            "jsdoc",
            "doxygen",
            -- Misc
            "http",
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore",
            "regex",
            "robots_txt",
            -- Configuration
            "dockerfile",
            "bash",
            "kdl",
            "kitty",
        })
        local config = require("nvim-treesitter.config")
        local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            callback = function(args)
            if vim.list_contains(config.get_installed(), vim.treesitter.language.get_lang(args.match)) then
                vim.treesitter.start(args.buf)
            end
    end
})
    end,
    opts = {},
    on_update = function()
	    vim.cmd("TSUpdate")
    end,
    sync = true
})

