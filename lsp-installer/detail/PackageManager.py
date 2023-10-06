class PackageManager:
	def __init__(
			self, 
			command: str, 
			installArgument: str, 
			installMultiplePackages: bool,
			):
		self.command = command
		self.install = installArgument
		self.allowMultiplePackages = installMultiplePackages