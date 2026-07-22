local keymaps = require("options.keymap").files

Plugins.add({
    name = "oil",
    src = "https://github.com/stevearc/oil.nvim",
    load = function()
    end,
    opts = {
        delete_to_trash = true,
        use_default_keymaps = false,
        keymaps = {
            [keymaps.show_help] = "actions.show_help",
            [keymaps.select] = "actions.select",
            [keymaps.select_vsplit] = "actions.select_vsplit",
            [keymaps.select_hsplit] = "actions.select_split",
            [keymaps.preview] = "actions.preview",
            [keymaps.close] = "actions.close",
            [keymaps.refresh] = "actions.refresh",
            [keymaps.parent] = "actions.parent",
            [keymaps.open_cwd] = "actions.open_cwd",
            [keymaps.cd] = "actions.cd",
            [keymaps.toggle_hidden] = "actions.toggle_hidden",
            [keymaps.open_external] = "actions.open_external"
        },
        float = {
            padding = 10,
            max_width = 75,
            max_height = 150,
            border = "single"
        },
        win_options = {
            signcolumn = "no",
            cursorcolumn = true
        },
        git = {
            -- Return true to automatically git add/mv/rm files
            add = function(path)
                return false
            end,
            mv = function(src_path, dest_path)
                return false
            end,
            rm = function(path)
                return false
            end,
        },
    }
})
