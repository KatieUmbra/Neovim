local configurations = {
    c = { lsp = "clangd", format = "clang-format" },
    lua = { lsp = "lua_ls", format = "lua-format" },
    vim = { lsp = "vimls" },
    rust = { lsp = "rust_analyzer", format = "rustfmt" },
    python = { lsp = "ty", format = "ruff_format" },
    cmake = { lsp = "neocmake", format = "gersemi" },
    css = { lsp = "cssls", format = "prettierd" },
    sql = { lsp = "sqlls", format = "sqruff" },
    typescript = { lsp = "vtsls", format = "prettierd" },
    html = { lsp = "emmet_language_server", format = "prettierd" },
    svelte = { lsp = "svelte", format = "prettierd" },
    glsl = { lsp = "glsl_analyzer" },
    gleam = { lsp = "gleam", format = "gleam" },
    zig = { lsp = "zls", format = "zigfmt" },
    odin = { lsp = "ols", format = "odinfmt" },
    rhai = {
        lsp = "rhai-lsp",
        format = "",
        custom = {
            config = {
                cmd = { "rhai-lsp", "lsp", "stdio" },
                filetypes = { "rhai" },
                root_markers = { { ".rhai" }, ".git" },
                settings = {}
            },
            filetype = {
                extension = {
                    rhai = "rhai"
                }
            }
        }
    },
    toml = { lsp = "taplo", format = "taplo" },
    yaml = { lsp = "yamlls", format = "yamlfmt" },
    docker = { lsp = "dockerls" },
    tailwind = { lsp = "tailwindcss", format = "rustywind" }
}

local formatters = {}

local enabled_languages = require("options.general").languages
for _, i in ipairs(enabled_languages) do
    local lsp = configurations[i].lsp
    if configurations[i].custom ~= nil then
        vim.lsp.config[lsp] = configurations[i].custom.config
        local ft = configurations[i].custom.filetype
        if ft then
            vim.filetype.add(ft)
        end
    end
    vim.lsp.enable(lsp)
    local format = configurations[i].format
    if format then
        local config = vim.lsp.config[lsp].filetypes
        config = config and config.filetypes or nil
        if config then
            local filetypes = config.filetypes
            for j in filetypes do
                format[j] = format
            end
        end
    end
end

Config.add({
    conform = {
        formatters_by_ft = formatters
    }
})
