Plugins.add({
    name = "rose-pine",
    src = "https://github.com/rose-pine/neovim",
    sync = true,
})

Plugins.add({
    name = "nord",
    src = "https://github.com/gbprod/nord.nvim",
    sync = true,
})

Plugins.add({
    name = "catppuccin",
    src = "https://github.com/catppuccin/nvim",
    sync = true,
})

local colorscheme_map = {
    rosepine = {
        vim_name = "rose-pine",
        require_name = "rose-pine",
        globals = {
            highlight_groups = {
                MiniPickBorder = { fg = "highlight_high", bg = "none" },
                MiniPickBorderBusy = { fg = "highlight_high", bg = "none" },
                MiniPickBorderText = { fg = "text", bg = "none" },
                MiniPickNormal = { bg = "none" },
                MiniPickPrompt = { bg = "none" },
                MiniPickPromptCaret = { bg = "none" },
                MiniPickPromptPrefix = { bg = "none" },
                MiniPickMatchCurrent = { fg = "love", bg = "surface" },
                NormalFloat = { bg = "none" },
                FloatBorder = { bg = "none" },
                FloatTitle = { bg = "none" },
                Normal = { bg = "none" },
                BlinkCmpMenu = { bg = "none" },
                BlinkCmpMenuBorder = { fg = "foam", bg = "none" },
                BlinkCmpSelection = { fg = "text", bg = "none" },
                BlinkCmpDoc = { bg = "none" },
                BlinkCmpDocBorder = { fg = "foam", bg = "none" },
                BlinkCmpDocSeparator = { fg = "foam", bg = "none" },
                BlinkCmpMenuSelection = { fg = "love", bg = "highlight_low" },
                BlinkCmpSignatureHelp = { bg = "none" },
                Pmenu = { bg = "none" },
                PmenuSel = { bg = "none" },
                PmenuThumb = { bg = "none" },
                BlinkCmpSignatureHelpBorder = { bg = "none" },
            }
        },
        variants = {
            default = {
                variant = "auto",
                dark_variant = "main",
                extend_background_behind_borders = true,
                enable = {
                    terminal = true
                }
            },
            moon = {
                variant = "auto",
                dark_variant = "moon",
                extend_background_behind_borders = true,
                enable = {
                    terminal = true
                }
            },
            dawn = {
                variant = "auto",
                dark_variant = "main",
                extend_background_behind_borders = true,
                enable = {
                    terminal = true
                }
            },
        }
    },
    catppuccin = {
        vim_name = "catppuccin-nvim",
        require_name = "catppuccin",
        globals = {
            custom_highlights = function(colors)
                vim.print(colors)
                return {
                    BlinkCmpMenu = { bg = colors.none },
                    BlinkCmpMenuBorder = { fg = colors.lavender, bg = colors.none },
                    BlinkCmpDoc = { bg = colors.none },
                    BlinkCmpDocBorder = { fg = colors.lavender, bg = colors.none },
                    BlinkCmpMenuSelection = { fg = colors.text, bg = colors.surface2 },
                    BlinkCmpKind = { fg = colors.text, bg = colors.none },
                }
            end
        },
        variants = {
            latte = {
                flavor = "latte",
                transparent_background = true,
                float = {
                    transparent = true,
                    solid = false
                },
                background = {
                    light = "latte",
                    dark = "mocha"
                },
                integrations = {
                    cmp = true,
                    mini = {
                        enabled = true
                    }
                }
            },
            frappe = {
                flavor = "frappe",
                transparent_background = true,
                float = {
                    transparent = true,
                    solid = false
                },
                background = {
                    light = "latte",
                    dark = "frappe"
                },
                integrations = {
                    cmp = true,
                    mini = {
                        enabled = true
                    }
                }
            },
            macchiato = {
                flavor = "macchiato",
                transparent_background = true,
                float = {
                    transparent = true,
                    solid = false
                },
                background = {
                    light = "latte",
                    dark = "macchiato"
                },
                integrations = {
                    cmp = true,
                    mini = {
                        enabled = true
                    }
                }
            },
            mocha = {
                flavor = "mocha",
                transparent_background = true,
                float = {
                    transparent = true,
                    solid = false
                },
                background = {
                    light = "latte",
                    dark = "mocha"
                },
                integrations = {
                    cmp = true,
                    mini = {
                        enabled = true
                    }
                }
            }
        }
    },
    nord = {
        vim_name = "nord",
        require_name = "nord",
        globals = {
            on_highlights = function(highlights, colors)
                highlights.MiniPickBorder = { fg = colors.snow_storm.bright, bg = colors.none }
                highlights.MiniPickBorderBusy = { fg = colors.snow_storm.bright, bg = colors.none }
                highlights.MiniPickBorderText = { fg = colors.snow_storm.brightest, bg = colors.none }
                highlights.MiniPickNormal = { bg = colors.none }
                highlights.MiniPickPrompt = { bg = colors.none }
                highlights.MiniPickPromptCaret = { bg = colors.none }
                highlights.MiniPickPromptPrefix = { bg = colors.none }
                highlights.MiniPickMatchCurrent = { fg = colors.snow_storm.brightest, bg = colors.polar_night.bright }
                highlights.NormalFloat = { bg = colors.none }
                highlights.FloatBorder = { bg = colors.none }
                highlights.FloatTitle = { bg = colors.none }
                highlights.BlinkCmpMenu = { bg = colors.none }
                highlights.BlinkCmpMenuBorder = { bg = colors.none }
                highlights.BlinkCmpDoc = { bg = colors.none }
                highlights.BlinkCmpDocBorder = { bg = colors.none }
                highlights.BlinkCmpMenuSelection = { fg = colors.snow_storm.brightest, bg = colors.polar_night.bright }
                highlights.Normal = { bg = colors.none }
                highlights.BlinkCmpSelection = { fg = colors.snow_storm.brightest, bg = colors.none }
                highlights.BlinkCmpDocSeparator = { fg = colors.polar_night.bright, bg = colors.none }
                highlights.BlinkCmpSignatureHelp = { bg = colors.none }
                highlights.Pmenu = { bg = colors.none }
                highlights.PmenuSel = { bg = colors.none }
                highlights.PmenuThumb = { bg = colors.none }
                highlights.BlinkCmpSignatureHelpBorder = { bg = colors.none }
            end
        },
        variants = {
            default = {
                transparent = true
            }
        }
    }
}

local opts = require("options.general")
vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        local selected_colorscheme = colorscheme_map[opts.colorscheme]
        local selected_variant = selected_colorscheme.variants[opts.variant]
        if selected_colorscheme.globals ~= nil then
            local merge = require("plugutil.merge")
            selected_variant = merge(selected_variant, selected_colorscheme.globals)
        end
        require(selected_colorscheme.require_name).setup(selected_colorscheme.variants[opts.variant])
        vim.cmd("colorscheme " .. selected_colorscheme.vim_name)
    end
})
