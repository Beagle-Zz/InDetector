contract c8722{
	// transfer balance to owner
	function withdrawEther(uint amount) public onlyOwner {
		require(amount > 0);
		owner.transfer(amount);
	}
}