require("neo-tree").setup {
	default_component_configs = {
		git_status = {
			symbols = {
				renamed   = "󰁕",
				unstaged  = "󰄱",
			},
		}
	},
	window = {
		position = "left",
		width = 25,
		mapping_options = {
			noremap = true,
			nowait = true
		}
	},
	document_symbols = {
		kinds = {
			File = { icon = "󰈙", hl = "Tag" },
			Namespace = { icon = "󰌗", hl = "Include" },
			Package = { icon = "󰏖", hl = "Label" },
			Class = { icon = "󰌗", hl = "Include" },
			Property = { icon = "󰆧", hl = "@property" },
			Enum = { icon = "󰒻", hl = "@number" },
			Function = { icon = "󰊕", hl = "Function" },
			String = { icon = "󰀬", hl = "String" },
			Number = { icon = "󰎠", hl = "Number" },
			Array = { icon = "󰅪", hl = "Type" },
			Object = { icon = "󰅩", hl = "Type" },
			Key = { icon = "󰌋", hl = "" },
			Struct = { icon = "󰌗", hl = "Type" },
			Operator = { icon = "󰆕", hl = "Operator" },
			TypeParameter = { icon = "󰊄", hl = "Type" },
			StaticMethod = { icon = '󰠄 ', hl = 'Function' },
		},
		window = {
			mappings = {
				["e"] = "toggle_node"
			}
		}
	},
	sources = {
		"filesystem",
		"buffers",
		"git_status",
		"document_symbols"
	},
	source_selector = {
		winbar = false,
		statusline = true,
		show_scrolled_off_parent_node = false,
		sources = {
			{ source = "filesystem" },
			{ source = "buffers" },
			{ source = "git_status" },
			{ source = "document_symbols" }
		},
	},
	name = {
		use_git_status_colors = true,
		highlight = "NeoTreeFileName"
	},
	filesystem = {
		filtered_items = {
			hide_gitignored = false
		}
	},
	event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          -- This effectively hides the cursor
          vim.cmd 'highlight! Cursor blend=100'
        end
      },
      {
        event = "neo_tree_buffer_leave",
        handler = function()
          -- Make this whatever your current Cursor highlight group is.
          vim.cmd 'highlight! Cursor guibg=#5f87af blend=0'
        end
      }
    },
	close_if_last_window = true
}
