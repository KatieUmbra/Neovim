local create_cmd = vim.api.nvim_create_user_command

create_cmd("WQ", "wq", {})
create_cmd("Wq", "wq", {})
create_cmd("W", "w", {})
create_cmd("Qa", "qa", {})
create_cmd("Q", "q", {})
