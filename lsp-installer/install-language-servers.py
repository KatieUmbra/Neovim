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

if not isTool("sudo") and packageManager == "apt-get":
	logging.error("You need sudo for apt-get")
	exit(1)

with open(f"{neovimRoot}/lsp-installer/log.txt", "w") as file:
	file.close()

installCommand(*lspData["default"])

outputText = ""
def install(command: list[str], packages: list[str], fallback: callable = None) -> bool:
	try:
		cmd = " ".join([*command, *packages])
		logging.info("Running '\033[38;5;8m%s\033[0m'", cmd)
		subprocess.run(cmd, shell=True, check=True, capture_output=True)
		logging.info("\033[38;5;51m%s\033[0m packages \033[38;5;40minstalled successfully\033[0m", command[0])
		return True
	except(subprocess.CalledProcessError):
		cmd = " ".join(["sudo", *command, *packages])
		logging.error("Error installing \033[38;5;8m%s\033[0m packages, trying again with sudo", command[0])
		logging.warning("Introduce your sudo password if necessary:")
		logging.info("Running '\033[38;5;8m%s\033[0m'", cmd)
		output = subprocess.run(cmd, shell=True, capture_output=True, text=True, stdin=subprocess.PIPE)
		outputText = output.stdout
		if output.returncode != 0:
			logging.error("Error installing \033[38;5;8m%s\033[0m packages, running fallback", command[0])
			if fallback is not None:
				if not fallback():
					logging.error("Error installing \033[38;5;8m%s\033[0m packages", command[0])
					logging.info("Writing log file as 'log.txt'")
					with open(f"{neovimRoot}/lsp-installer/log.txt", "a") as file:
						file.write(f"{command[0]} log:" + outputText + "\n")
					return False
				else:
					logging.info("\033[38;5;51m%s\033[0m packages \033[38;5;40minstalled successfully\033[0m", command[0])
					return True

	logging.info("\033[38;5;51m%s\033[0m packages \033[38;5;40minstalled successfully\033[0m", command[0])
	return True

def pip3Fallback() -> bool:
	if (packageManager != "yay"):
		return False
	packages = []
	for i in lspData["pip3"]:
		if (i.startswith("python")):
			packages.append(i)
		else:
			packages.append("python-" + i)
	installCommand(*packages)
	return True

install(["npm", "i", "-g"], lspData["npm"])
install(["cargo", "install"], lspData["cargo"])
install(["pip3", "install"], lspData["pip3"], fallback=pip3Fallback)

logging.warning("Make sure the binaries are in your path")
