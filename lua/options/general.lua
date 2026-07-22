local M = {}

-- {# replace_in(`"`, data.color.name) #}
M.colorscheme = "nord"
-- {# replace_in(`"`, data.color.variant) #}
M.variant = "default"
-- {# replace_in(`"`, data.color.brightness) #}
M.brightness = "dark"

M.languages = {
    ["c"] = true,
    ["lua"] = true,
    ["vim"] = true,
    ["rust"] = true,
    ["python"] = true,
    ["cmake"] = true,
    ["css"] = true,
    ["sql"] = true,
    ["typescript"] = true,
    ["html"] = true,
    ["svelte"] = true,
    ["glsl"] = true,
    ["gleam"] = true,
    ["zig"] = true,
    ["odin"] = true,
    ["rhai"] = true,
    ["toml"] = true,
    ["yaml"] = true,
    ["docker"] = true,
    ["tailwind"] = true,
}

M.format_notificaion = true

M.formatters = {
    ["clang-format"] = true,
    ["lua-format "] = true,
    ["rustfmt"] = true,
    ["ruff_format"] = true,
    ["gersemi"] = true,
    ["prettierd"] = true,
    ["sqruff"] = true,
    ["gleam"] = true,
    ["zigfmt"] = true,
    ["odinfmt"] = true,
    ["taplo"] = true,
    ["yamlfmt"] = true,
    ["rustywind"] = true
}

return M
