--[[
-- Yoinked from
-- https://fredrikaverpil.github.io/blog/2026/04/15/from-lazy.nvim-to-vim.pack/#finding-the-right-pattern
-- cba to write this from scratch, it's useful enough, I will try my best to comment what each line
-- does though
]]--

local M = {}

local vim_enter_queue = {}
local override_queue = {}

-- Drains the queue by checking each entry to see if it should block the main thread or not,
-- then runs it accordingly
local function drain(queue)
	for _, entry in ipairs(queue) do
        -- First pass schedules functions so they don't run immediately (because we don't need them
        -- right away), unless we want them to run at startup
        if not entry.sync then
            -- Essentially if the entry isn't sync (so async, meaning off-thread)
            -- then it will schedule the function
			vim.schedule(entry.fn)
		end
        -- The second pass of the function, it just runs the synchronous functions right away
		if entry.sync then
            entry.fn()
        end
	end
end

-- AFAIK this is for per-project overrides in plugin loading order
local function drain_override()
    -- if there are no overrides then return (DUH)
    if not override_queue then return end
    for _, entry in ipairs(override_queue) do
        -- Run asynchronously each override and print out the errors to the error output
        vim.schedule(function()
            local ok, err = pcall(entry.fn)
            if not ok then
                vim.notify(
                    (".nvim.lua override error:\n%s"):format(err),
                    vim.log.levels.ERROR
                )
            end
        end)
    end
    -- We're done so we can discard the override queue
    override_queue = nil
end

-- Deferred loading to plugins that must run once we enter a buffer
vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        -- Drain the queue once we enter a buffer
        drain(vim_enter_queue)
        vim_enter_queue = nil
        -- And then execute overrides (if they exist)
        drain_override()
    end
})

-- Basically if the queue exists (which it does by default) then it gets added to it,
-- otherwise this gets run AFTER we entered a buffer, therefore we just run the function
-- right away
function M.on_vim_enter(fn, opts)
    -- If there's a sync option passed, use that, or prefer false
    local sync = opts and opts.sync or false
    if vim_enter_queue then
        table.insert(vim_enter_queue, { fn = fn, sync = sync })
    elseif sync then
        fn()
    else
        vim.schedule(fn)
    end
end

-- Same thing for the overrides
function M.on_override(fn)
    if override_queue then
        table.insert(override_queue, { fn = fn })
    else
        vim.schedule(fn)
    end
end

return M
