import os
homeFolder = os.path.expanduser("~")
neovimRoot = ""
if os.name == "nt":
	neovimRoot = f"{homeFolder}/AppData/Local/nvim"
else:
	neovimRoot = f"{homeFolder}/.config/nvim"