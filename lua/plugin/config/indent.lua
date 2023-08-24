local function setColor(number, value)
	vim.cmd ([[highlight IndentBlanklineIndent]]..number..[[ guifg=#]]..value..[[ gui=nocombine]])
end

for _, v in pairs(require("options.color").rosepineColors) do
	setColor(v.id, v.color)
end

local options = vim.opt

options.list = true
options.listchars:append "space:⋅"
options.listchars:append "eol:↴"
options.listchars:append "tab:⋅⋅"

require("indent_blankline").setup {
	space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
		"IndentBlanklineIndent7"
    },
}
