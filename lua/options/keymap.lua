local M = {
    general = {
        delete_line = "<leader>dd",
        replace_line = "<leader>dl",
        yank_system = "<leader>ys",
        paste_system = "<leader>ps"
    },
    picker = {
        project_files = "<leader>ff",
        all_files = "<leader>fa",
        pattern_match = "<leader>fz",
        buffers = "<leader>fb",
        help_tags = "<leader>fh",
        cli_output = "<leader>fc"
    },
    files = {
        open_float = "<leader>of",
        open_oil = "<leader>oo",
        show_help = "g?",
        select_vsplit = "gv",
        select_hsplit = "gh",
        preview = "gP",
        close = "gS",
        refresh = "gr",
        parent = "gp",
        open_cwd = "gC",
        cd = "gc",
        toggle_hidden = "g.",
        select = "<CR>",
        open_external = "gx"
    },
    language = {
        diagnostics = "<leader>ae",
        actions = "<leader>aa",
        rename = "<leader>ar",
        hover = "<leader>ah",
        implementations = "<leader>ai",
        types = "<leader>at",
        ws_symbols = "<leader>as"
    },
    formatting = {
        format = "<leader>df",
        format_write = "<leader>dF"
    },
    util = {
        new_file = "<leader>nf"
    }
}

return M
