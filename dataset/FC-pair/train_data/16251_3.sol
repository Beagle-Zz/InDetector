contract c16251{
	// transfer balance to owner
	function withdrawEther(uint256 amount) {
		if(msg.sender != owner)throw;
		owner.transfer(amount);
	}
}