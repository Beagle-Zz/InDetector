contract c11879{
	/**
	* @dev Method called by owner of contract to withdraw funds
	*/
	function withdraw() onlyOwner public {
		wallet.transfer(this.balance);
	}
}