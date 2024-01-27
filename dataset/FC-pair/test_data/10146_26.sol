contract c10146{
	/**
	* @dev withdraw funds 
	* This will set the withdrawal wallet
	* 
	* @param _wallet The address to transmit to.
	*/	
	function setWallet(address _wallet) onlyOwner public returns(bool) {
		// set wallet 
		wallet = _wallet;
		WalletChange(_wallet , now);
		return true;
	}
}