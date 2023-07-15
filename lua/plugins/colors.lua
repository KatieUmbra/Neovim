local ccc = require("ccc")

ccc.setup {
	ccc.picker.ansi_escape(),
	highlighter = {
		auto_enable = true,
		lsp = true
	}
}
