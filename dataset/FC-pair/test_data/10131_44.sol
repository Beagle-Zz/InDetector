contract c10131{
	// adds an address that will have the right to add investors
	function addManager(address _managerAddr) external onlyOwner returns (bool) {
		if(managers[_managerAddr]){
			error("addManager: manager account already exists.");
			return false;
		}
		managers[_managerAddr] = true;
		emit AddManager(_managerAddr, timestamp());
	}
}