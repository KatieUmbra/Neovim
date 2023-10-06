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
			return {"name": name, "contents": contents}
		except(KeyError):
			print("Package Manager is not registered")

def generateInstallCommand(packageManagerName: str) -> callable:
	pm = loadPackageManager(packageManagerName)
	if pm["contents"]["valid"]:
		def function(*args: str):
			cmd = [pm["name"], pm["contents"]["command"]]
			newArgs = []

			overrides = pm["contents"]["overrides"]
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
				if i not in pm["contents"]["unavailable"]:
					newArgs.append(i)
			
			fullCmd = " ".join([*cmd, *newArgs])
			
			if pm["contents"]["singleInstallPerCommand"]:
				for i in newArgs:
					logging.info("Installing default package %s", i)
					try:
						subprocess.run(fullCmd, shell=True, check=True, capture_output=True)
					except(subprocess.CalledProcessError):
						logging.error("Error installing %s", i)
			else:
				logging.info("Installing default packages")
				try:
					logging.info("Running \033[38;5;8m'%s'\033[0m", fullCmd)
					subprocess.run(fullCmd, shell=True, check=True, capture_output=True)
				except(subprocess.CalledProcessError):
					logging.error("Error installing packages")

			logging.info("Packages \033[38;5;40minstalled successfully\033[0m")
			unavailable = pm["contents"]["unavailable"]
			if len(unavailable) != 0:
				logging.warn("The following packages were unavailable: " + " ".join(unavailable))
		
		return function
	else:
		logging.error("Package Manager %s doesn not exist or hasn't been configured", packageManagerName)
		exit(1)