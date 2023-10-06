import argparse
import json
import logging
import subprocess
from detail.loadPM import generateInstallCommand
from detail.nvimRootDir import neovimRoot
from detail.isTool import isTool

logging.basicConfig(
	format="%(levelname)s: %(message)s",
	level=logging.INFO
)

logging.addLevelName(logging.WARN, "\033[38;5;208mWARN\033[0m")
logging.addLevelName(logging.INFO, "\033[38;5;40mINFO\033[0m")
logging.addLevelName(logging.ERROR, "\033[38;5;196mERROR\033[0m")

parser = argparse.ArgumentParser(description="Installs language servers for katherine's neovim config")

parser.add_argument("-p", "--package-manager", type=str, action="store", nargs=1, required=True, help="the default package manager to be used install language servers")

args = parser.parse_args()

packageManager = args.package_manager[0]
installCommand: callable = generateInstallCommand(packageManager)
lspData = {}

with open(f"{neovimRoot}/lsp-installer/resources/lsps.json", "r") as file:
	lspData = json.loads(file.read())
	result = True
	for i in lspData:
		selected = ""
		if (i == "default"):
			selected = packageManager
		else:
			selected = i
		result &= isTool(selected)
	if not result:
		logging.error("Install missing dependencies before running the script again")
		exit(1)

installCommand(*lspData["default"])

def install(command: list[str], packages: list[str]) -> bool:
	try:
		cmd = " ".join([*command, *packages])
		logging.info("Running '\033[38;5;8m%s\033[0m'", cmd)
		subprocess.run(cmd, shell=True, check=True, capture_output=True)
	except(subprocess.CalledProcessError):
		logging.error("Error installing \033[38;5;8m%s\033[0m packages", command[0])
		return False
	logging.info("%s packages \033[38;5;40minstalled succesfully\033[0m", command[0])
	return True

install(["npm", "i", "-g"], lspData["npm"])
install(["cargo", "install"], lspData["cargo"])
install(["pip3", "install"], lspData["pip3"])

logging.warning("Make sure the binaries are in your path")