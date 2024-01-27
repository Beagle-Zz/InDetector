contract c8705{
	// transfer balance to owner
   function  withdrawEther(uint256 amount) public {
		if(msg.sender != owner) revert();//throw;
		owner.transfer(amount);
	}
}