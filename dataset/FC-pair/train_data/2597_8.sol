contract c2597{
	// transfer contract balance to owner
	function retrieveEther(uint256 amount) onlyOwner public {
	    require(amount > 0);
	    require(amount <= address(this).balance);
		msg.sender.transfer(amount);
	}
}