vim.pack.add({ {name = "mini.nvim", src = "https://github.com/nvim-mini/mini.nvim"} })

require("mini.icons").setup()
local header_path = vim.fs.normalize("$HOME/.config/nvim/lain")
local header = ""
local f = io.open(header_path, "r")
if f then
    f:close()
    for line in io.lines(header_path) do
        header = header .. line .. '\n'
    end
else
    vim.notify_once("Couldn't load the startup header file, open a bug report.", vim.log.levels.ERROR)
end

require("mini.starter").setup({
    autoopen = true,
    header = header,
    items = {
        {
            name = " Find files            ,fa",
            action = "Pick files",
            section = "Actions"
        },
        {
            name = " Git files             ,ff",
            action = "Pick files tool='git'",
            section = "Actions"
        },
        {
            name = " File Browser          ,of",
            action = "lua require('oil').open_float(nil)",
            section = "Actions"
        },
        {
            name = " New File              ,nf",
            action = "enew",
            section = "Actions"
        }
    },
    footer = "github.com/KatieUmbra/Neovim",
    silent = true
})
-- Lazy loading mini modules AFTER vim boots up
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function ()
        local window_config = function()
            local height = math.floor(0.618 * vim.o.lines)
            local width = math.floor(75)
            return {
                anchor = 'NW', height = height, width = width,
                row = math.floor(0.5 * (vim.o.lines - height)),
                col = math.floor(0.5 * (vim.o.columns - width))
            }
        end
        require("mini.pick").setup({
            window = { config = window_config }
        })
        require("mini.trailspace").setup()
        require("mini.surround").setup({
            custom_surroundings = {
                  [')'] = { output = { left = '( ', right = ' )' } }
            }
        })
    end
})

-- Scheduling mini modules to open AFTER a file is opened
vim.api.nvim_create_autocmd("FileType", {
    callback = function ()
        require("mini.git").setup()
        local statusline = require("mini.statusline")
        require("mini.statusline").setup({
            content = {
                active = function()
                    local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
                    local git           = statusline.section_git({ trunc_width = 40})
                    -- https://stackoverflow.com/a/3693663
                    local fileinfo_tb   = vim.split(statusline.section_fileinfo({ trunc_width = 75 }), " ", { plain = true })
                    local fileinfo      = fileinfo_tb[1].." "..fileinfo_tb[2]
                    local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
                    local diagnostics   = statusline.section_diagnostics({ trunc_width = 75})
                    local location_tb   = vim.api.nvim_win_get_cursor(0)
                    local location      = string.format("%u:%u", location_tb[1], location_tb[2])
                    local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

                    return statusline.combine_groups({
                        { hl = mode_hl, strings = { string.upper(mode) } },
                        { hl = "MiniStatuslineDevinfo", strings = { git } },
                        { hl = "MiniStatuslineFilename", strings = { vim.fn.expand("%:.") } },
                        "%<",
                        { hl = "MiniStatuslineDevinfo", strings = { vim.ui.progress_status(), lsp, "|" , diagnostics} },
                        "%=",
                        { hl = "MiniStatusFileInfo", strings = { fileinfo } },
                        { hl = mode_hl, strings = { search, location } },
                    })
                end,
                inactive = function ()
                    local location_tb   = vim.api.nvim_win_get_cursor(0)
                    local location      = string.format("%u:%u", location_tb[1], location_tb[2])
                    return statusline.combine_groups({
                        { hl = "MiniStatuslineDevinfo", strings = { vim.fn.expand("%:.") } },
                        "%<",
                        { hl = "MiniStatusFileInfo", string = { "" } },
                        "%=",
                        { hl = "MiniStatuslineDevinfo", strings = { location } },
                    })
                end
            }
        })

        require("mini.pairs").setup({
            mappings = {
                ["<"] = { action = "open", pair = "<>", neigh_pattern = "^[^\\]" },
                [">"] = { action = "close", pair = "<>", neigh_pattern = "^[^\\]" },
            }
        })
        require("mini.cursorword").setup({ delay = 0 })
        local gen_loader = require("mini.snippets").gen_loader
        require("mini.snippets").setup({
            snippets = {
                gen_loader.from_file(vim.fs.normalize("$HOME/.config/nvim/snippets/global.json")),
                gen_loader.from_lang()
            }
        })
    end
})
