import json
from detail.PackageManager import PackageManager
import subprocess
import logging
from detail.nvimRootDir import neovimRoot

def loadPackageManager(name: str) -> PackageManager:
	with open(f"{neovimRoot}/lsp-installer/resources/pms.json", "r") as file:
		fileText = file.read()
		contents = {}
		try:
			contents = json.loads(fileText)[name]
			return contents
		except(KeyError):
			print("Package Manager is not registered")

def generateInstallCommand(packageManagerName: str) -> callable:
	pm = loadPackageManager(packageManagerName)
	if pm["valid"]:
		def function(*args: str):
			cmd = [pm["cmd"], pm["command"]]
			newArgs = []
			overrides = pm["overrides"]
			overriddenValues = [x["original"] for x in overrides]
			actualArguments = []

			for i in args:
				if i in overriddenValues:
					for j in overrides:
						if j["original"] == i:
							actualArguments.append(j["replace"])
				else:
					actualArguments.append(i)


			for i in actualArguments:
				if i not in pm["unavailable"]:
					newArgs.append(i)

			fullCmd = " ".join([*cmd, *newArgs])

			if pm["singleInstallPerCommand"]:
				for i in newArgs:
					logging.info("Installing default package %s", i)
					try:
						logging.warning("Introduce your sudo password if necessary:")
						subprocess.run(fullCmd, shell=True, check=True, capture_output=True, stdin=subprocess.PIPE)
						logging.info("Packages \033[38;5;40minstalled successfully\033[0m")
					except(subprocess.CalledProcessError):
						logging.error("Error installing %s", i)
			else:
				logging.info("Installing default packages")
				logging.info("Running \033[38;5;8m'%s'\033[0m", fullCmd)
				logging.warning("Introduce your sudo password if necessary:")
				output = subprocess.run(fullCmd, shell=True, capture_output=True, text=True, stdin=subprocess.PIPE)
				if output.returncode != 0:
					logging.error("Error installing packages")
					logging.info("Writing log file as 'log.txt'")
					with open(f"{neovimRoot}/lsp-installer/log.txt", "a") as file:
						file.write(f"{cmd[0]} log:" + output.stdout + "\n")
					logging.warning("\033[38;5;208mthis could happen if no packages were upgraded, check log file for more info\033[0m")
				else:
					logging.info("Packages \033[38;5;40minstalled successfully\033[0m")

			unavailable = pm["unavailable"]
			if len(unavailable) != 0:
				logging.warning("The following packages were unavailable: " + " ".join(unavailable))
			
		return function
	else:
		logging.error("Package Manager %s doesn not exist or hasn't been configured", packageManagerName)
		exit(1)
