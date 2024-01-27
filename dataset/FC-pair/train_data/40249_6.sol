contract c40249{
	 
	function isMember (DaoAccount account, address allegedOwnerAddress) returns (bool) {
		if (account == DaoAccount(0x00)) return false;
		if (allegedOwnerAddress == 0x00) return false;
		if (daoAccounts[allegedOwnerAddress] == DaoAccount(0x00)) return false;
		 
		if (daoAccounts[allegedOwnerAddress] != account) return false;
		return true;
	}
}