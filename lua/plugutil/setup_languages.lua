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
local lsp_enablers = {}

local general_opts = require("options.general")
local enabled_languages = general_opts.languages
local enabled_formatters = general_opts.formatters
for k, v in pairs(configurations) do
    if not enabled_languages[k] then goto continue end
    local lsp = v.lsp
    if v.custom ~= nil then
        vim.lsp.config[lsp] = v.custom.config
        local ft = v.custom.filetype
        if ft then
            vim.filetype.add(ft)
        end
    end
    lsp_enablers[lsp] = function()
        vim.lsp.enable(lsp)
    end
    local format = v.format
    if enabled_formatters[format] then
        local config = vim.lsp.config[lsp].filetypes
        config = config and config.filetypes or nil
        if config then
            local filetypes = config.filetypes
            for j in filetypes do
                format[j] = format
            end
        end
    end
    ::continue::
end

-- Only enable language servers once they are needed, this is almost negligle
-- but who cares!
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        for _, v in pairs(lsp_enablers) do
            v()
        end
    end,
    once = true
})

Config.add({
    conform = {
        formatters_by_ft = formatters
    }
})
