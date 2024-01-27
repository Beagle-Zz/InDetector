contract c40390{
	 
	function OwnerGetFee() external OnlyOwner {
		if (ownerBalance == 0) { throw; }
		if (owner.send(ownerBalance) == false) { throw; }
		ownerBalance = 0;
	}
}