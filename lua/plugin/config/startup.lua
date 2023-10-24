local default_margin = 0

local settings = {
    -- every line should be same width without escaped \
    header = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Header",
        margin = default_margin,
		content = {
			"						⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠄⠒⠒⠀⠐⠒⠢⠤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀						  ",
			"						⠀⠀⠀⠀⠀⠀⠴⡢⠀⠀⠤⠀⠐⢠⠄⠀⠠⡤⠀⠈⠒⠒⡢⡀⠀⠀⠀⠀⠀⠀						  ",
			"						⠀⠀⠀⠀⠀⠀⠃⡘⠀⠀⣀⣡⣤⣤⣤⣦⣤⣤⣈⡄⠀⠀⠈⠀⡇⠀⠀⠀⠀⠀⠀						  ",
			"						⠀⠀⠀⠀⠀⠀⢲⢀⣴⠾⠟⠛⠉⡉⠉⡉⠉⣩⠛⠛⠷⣄⠀⡏⠀⠀⠀⠀⠀⠀⠀						  ",
			"						⠀⠀⠀⠀⠀⠀⠈⡘⠁⡅⡆⠀⢠⢁⠀⣇⠈⢹⡍⠀⠀⢈⡆⡇⠀⠀⠀⠀⠀⠀⠀						  ",
			"						⠀⠀⠀⠀⠀⠀⢠⠇⣧⡷⢡⢄⡄⠂⠂⠃⠈⡽⣭⢢⠐⡀⢈⡇⠀⠀⠀⠀⠀⠀⠀						  ",
			"						⠀⠀⠀⠀⠀⠀⠀⢸⡘⡂⠀⠁⠁⠀⠀⠀⠀⠉⠁⢸⠠⣿⡎⠇⠀⠀⠀⠀⠀⠀⠀						  ",
			"						⠀⠀⠀⠀⠀⠀⢠⠀⡟⠿⠢⢀⠀⠀⠀⠄⠀⢀⡠⡯⠝⠙⠀⢸⠀⠀⠀⠀⠀⠀⠀						  ",
			"						⠀⠀⠀⠀⠀⠀⠸⡀⢁⡀⠀⡀⠉⠋⣤⢢⠅⠉⠄⡛⠀⡠⢡⠊⠀⠀⠀⠀⠀⠀⠀						  ",
			"						⠀⠀⠀⠀⠀⠀⠀⠸⠑⠂⠌⠒⠂⠐⠙⡀⠁⠈⠙⠐⠂⠂⢸⠀⠀⠀⠀⠀⠀⠀⠀						  ",
			"						⠀⠀⠀⠀⠀⠀⢀⠗⠂⠀⠠⠀⠀⠀⠈⠀⠀⠀⠀⠄⢊⠀⠀⡆⠀⠀⠀⠀⠀⠀⠀						  ",
			"						⠀⠀⠀⠀⠀⠀⠣⠤⠤⠂⢊⠀⠠⠄⠀⠀⠀⠀⠀⢀⠀⠦⠤⠇⠀⠀⠀⠀⠀⠀⠀						  ",
			"						⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠤⠤⠤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀						  ",
			"██╗  ██╗ █████╗ ████████╗██╗  ██╗██╗   ██╗███████╗    ██╗   ██╗██╗███╗   ███╗",
			"██║ ██╔╝██╔══██╗╚══██╔══╝██║  ██║╚██╗ ██╔╝██╔════╝    ██║   ██║██║████╗ ████║",
			"█████╔╝ ███████║   ██║   ███████║ ╚████╔╝ ███████╗    ██║   ██║██║██╔████╔██║",
			"██╔═██╗ ██╔══██║   ██║   ██╔══██║  ╚██╔╝  ╚════██║    ╚██╗ ██╔╝██║██║╚██╔╝██║",
			"██║  ██╗██║  ██║   ██║   ██║  ██║   ██║   ███████║     ╚████╔╝ ██║██║ ╚═╝ ██║",
			"╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝   ╚══════╝      ╚═══╝  ╚═╝╚═╝     ╚═╝"
		},
        highlight = "Statement",
        default_color = "",
        oldfiles_amount = 0,
    },
    body = {
        type = "mapping",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Basic Commands",
        margin = default_margin,
        content = {
            { " 󰇙 Files", "Telescope find_files", "<leader>ff" },
			{ " 󰇙 Oil", "lua require('oil').open_float(nil)", "<leader>of" },
            { " 󰇙 Words", "Telescope live_grep", "<leader>fl" },
            { " 󰇙 Recent", "Telescope oldfiles", "<leader>fo" },
            { " 󰇙 New", "lua require'startup'.new_file()", "<leader>nf" },
        },
        highlight = "String",
        default_color = "",
        oldfiles_amount = 0,
    },
    footer = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Footer",
        margin = default_margin,
        content = { "https://github.com/KatieUmbra/Neovim", "Katherine's Minimal Config" },
        highlight = "Number",
        default_color = "",
        oldfiles_amount = 0,
    },

    options = {
        mapping_keys = true,
        cursor_column = 2,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 1, 0, 2, 0 },
    },
    mappings = {
        execute_command = "<CR>",
        open_file = "o",
        open_file_split = "<c-o>",
        open_section = "<TAB>",
        open_help = "?",
    },
    colors = {
        background = "#6e6a86",
        folded_section = "#3e8fb0",
    },
    parts = { "header", "body", "footer" },
}

require("startup").setup(settings)
