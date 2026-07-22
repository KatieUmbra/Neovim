--[[
-- Once again yoinked from
-- https://fredrikaverpil.github.io/blog/2026/04/15/from-lazy.nvim-to-vim.pack/#passing-opts-from-one-plugin-to-another
]] --
local merge = require("plugutil.merge")

-- Global configuration registry to add overrides for the setup
-- configuration of other plugins, adding to them instead of replacing!
_G.Config = {}

_G.Plugins = {}

function _G.Config.add(spec)
    merge(_G.Config, spec)
end

function _G.Plugins.add(plugopts)
    _G.Config[plugopts.name] = _G.Config[plugopts.name] or {}
    -- Please don't mind the fact that there's around 5 nested functions here
    require("plugutil.lazyload").on_vim_enter(function()
        local runnable = function()
            if plugopts.on_install ~= nil or plugopts.on_update ~= nil then
                vim.api.nvim_create_autocmd("PackChanged", {
                    callback = function(ev)
                        local name, kind = ev.data.spec.name, ev.data.kind
                        if name == plugopts.name then
                            if kind == "install" and plugopts.on_install ~= nil then
                                plugopts.on_install()
                            elseif kind == "update" and plugopts.on_update ~= nil then
                                plugopts.on_update()
                            end
                        end
                    end
                })
            end
            local pack = merge({ { src = plugopts.src, name = plugopts.name } }, { plugopts.packopts } or {})
            vim.pack.add(pack)
            if plugopts.no_opts == false or plugopts.no_opts == nil then
                local opts = plugopts.opts
                merge(opts, _G.Config[plugopts.name].opts or {})
                require(plugopts.name).setup(opts)
            end
            if plugopts.load ~= nil then
                plugopts.load()
            end
        end
        local _, err = pcall(runnable)
        if err then
            vim.notify("Error loading plugin: " .. plugopts.name, vim.log.levels.ERROR)
            vim.print(plugopts, vim.log.levels.ERROR)
            vim.print(err, vim.log.levels.ERROR)
        end
    end, { sync = plugopts.sync })
end

-- Import the rest of the configuration
require("autocommands")
require("options")
require("keymap")
