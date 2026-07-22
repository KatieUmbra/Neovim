local defaults = { noremap = true, silent = true, nowait = true }
local function key(lhs, rhs)
    vim.keymap.set("n", lhs, rhs, defaults)
end
local keymap = require("options.keymap")

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function(ev)
        key(keymap.general.new_file, function() vim.cmd [[ enew ]] end)
        vim.keymap.set("v", keymap.general.yank_system, [["+y]])
        vim.keymap.set("v", keymap.general.yank_system_line, [["+yy]])
        vim.keymap.set({ "n", "v" }, keymap.general.paste_system, [["+p]])

        key(keymap.files.open_float, function() require("oil").open_float(nil) end)
        key(keymap.files.open_oil, ":Oil<CR>")

        key(keymap.picker.project_files, function()
            local path = vim.uv.cwd() .. "/.git"
            local ok, err = vim.uv.fs_stat(path)
            if not ok then
                MiniPick.builtin.files()
            else
                MiniPick.builtin.files({ tool = "git" })
            end
        end)
        key(keymap.picker.all_files, function() MiniPick.builtin.files() end)
        key(keymap.picker.pattern_match, function() MiniPick.builtin.grep_live() end)
        key(keymap.picker.buffers, function() MiniPick.builtin.buffers() end)
        key(keymap.picker.help_tags, function() MiniPick.builtin.help() end)
        key(keymap.picker.cli_output, function()
            local ok, err = pcall(function()
                MiniPick.builtin.cli()
            end)
            if not ok then
                vim.notify("Expected a cli command", vim.log.levels.ERROR)
            end
        end)

        key(keymap.language.actions, function() vim.lsp.buf.code_action() end)
        key(keymap.language.diagnostics, function() vim.diagnostic.open_float() end)
        key(keymap.language.hover, function() vim.lsp.buf.hover() end)
        key(keymap.language.implementations, function() vim.lsp.buf.implementation() end)
        key(keymap.language.rename, function() vim.lsp.buf.rename() end)
        key(keymap.language.types, function() vim.lsp.buf.type_definition() end)
        key(keymap.language.ws_symbols, function() vim.lsp.buf.workspace_symbol() end)

        local function vcmd(cmd)
            return function()
                vim.cmd(cmd)
            end
        end

        key(keymap.window.select_left, vcmd([[ wincmd h ]]))
        key(keymap.window.select_down, vcmd([[ wincmd j ]]))
        key(keymap.window.select_up, vcmd([[ wincmd k ]]))
        key(keymap.window.select_right, vcmd([[ wincmd l ]]))

        key(keymap.window.move_left, vcmd([[ wincmd H ]]))
        key(keymap.window.move_down, vcmd([[ wincmd J ]]))
        key(keymap.window.move_up, vcmd([[ wincmd K ]]))
        key(keymap.window.move_right, vcmd([[ wincmd L ]]))

        key(keymap.window.resize_left, vcmd([[ wincmd < ]]))
        key(keymap.window.resize_down, vcmd([[ wincmd - ]]))
        key(keymap.window.resize_up, vcmd([[ wincmd + ]]))
        key(keymap.window.resize_right, vcmd([[ wincmd > ]]))
    end
})
