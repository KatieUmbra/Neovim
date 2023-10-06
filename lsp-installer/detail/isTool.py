import logging

def isTool(name: str) -> bool:
	from shutil import which
	isValid = which(name) is not None
	if (isValid):
		logging.info("%s is present", name)
	else:
		logging.error("%s is not present, install it before calling the script again", name)
	return isValid