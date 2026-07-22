local M = {}

-- {# replace_in(`"`, data.color.name) #}
M.colorscheme = "nord"
-- {# replace_in(`"`, data.color.variant) #}
M.variant = "default"
-- {# replace_in(`"`, data.color.brightness) #}
M.brightness = "dark"

M.languages = {
    "c",
    "lua",
    "vim",
    "rust",
    "python",
    "cmake",
    "css",
    "sql",
    "typescript",
    "html",
    "svelte",
    "glsl",
    "gleam",
    "zig",
    "odin",
    "rhai",
    "toml",
    "yaml",
    "docker",
    "tailwind",
}

return M
