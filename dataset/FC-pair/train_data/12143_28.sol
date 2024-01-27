contract c12143{
	/**
	* @dev close contract 
	* This will send remaining token balance to owner
	* This will distribute available funds across team members
	*/	
	function close() onlyOwner public {
		// send remaining tokens back to owner.
		uint256 tokens = token.balanceOf(this).sub(totalLockedBonus); 
		token.transfer(owner , tokens);
		// withdraw funds 
		withdraw();
		// mark the flag to indicate closure of the contract
		isClose = true;
	}
}