local undodir = vim.fn.expand("~/.local/undodir")
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end

local options = {
    -- Use :help <option> to read more

    -- Cursor
    number = true,
    relativenumber = true,
    cursorline = true,
    wrap = false,
    scrolloff = 10,
    sidescrolloff = 10,

    -- Tab
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
    smartindent = true,
    autoindent = true,

    -- Search & Casing
    ignorecase = true,
    smartcase = true,
    hlsearch = true,
    incsearch = true,

    -- Miscelaneous
    signcolumn = "yes",
    colorcolumn = "",
    showmatch = true,
    cmdheight = 1,
    showmode = false,
    pumheight = 10,
    pumblend = 10,
    winblend = 0,
    conceallevel = 0,
    concealcursor = "",
    lazyredraw = true,
    synmaxcol = 300,
    list = true,
    fillchars = { eob = "" },
    listchars = {
        space = "⋅",
        tab = "│⋅",
        eol = "↴",
        trail = "󰑀",
        extends = "󱞥",
        precedes = "󱞩",
    },
    redrawtime = 10000,
    maxmempattern = 20000,
    showtabline = 0,

    -- File
    backup = false,
    writebackup = false,
    swapfile = false,
    undofile = true,
    undodir = undodir,
    updatetime = 300,
    timeoutlen = 500,
    ttimeoutlen = 0,
    autoread = true,
    autowrite = false,
    formatexpr = "v:lua.require'conform'.formatexpr()",

    -- Buffer
    completeopt = "menu,menuone,noselect,noinsert",
    hidden = true,
    errorbells = false,
    backspace = "indent,eol,start",
    autochdir = false,
    selection = "exclusive",
    mouse = "",
    modifiable = true,
    encoding = "UTF-8",

    -- Folds
    foldmethod = "expr",
    foldexpr = "v:lua.vim.treesitter.foldexpr()",
    foldlevel = 99,

    -- Splits
    splitbelow = true,
    splitright = true,

    -- Vanity
    syntax = "ON",
    termguicolors = true,
    background = require("options.general").brightness,

    -- UI
    winborder = "single"
}

---@diagnostic disable-next-line: lowercase-global
global = {
    mapleader = ",",
    maplocalleader = ",",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

for k, v in pairs(global) do
    vim.g[k] = v
end

vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.opt.diffopt:append("linematch:60")
vim.opt.completeopt:append("popup")
