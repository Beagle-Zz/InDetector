contract c10131{
	// removes a manager address
	function delManager(address _managerAddr) external onlyOwner returns (bool) {
		if(!managers[_managerAddr]){
			error("delManager: manager account not found.");
			return false;
		}
		delete managers[_managerAddr];
		emit DelManager(_managerAddr, timestamp());
	}
}