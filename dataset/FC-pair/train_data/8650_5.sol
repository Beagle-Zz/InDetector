contract c8650{
    // withdrawal function is called monthly
    function withdrawBalance(uint256 _amount) external onlyOwner  {
        uint256 amount = this.balance;
		if(_amount <= amount)
		{
		    amount = participantsFirst(_amount);
			owner.transfer(_amount);
		}
		else
		{
		    amount = participantsFirst(amount);
		    owner.transfer(amount);
		}
    }
}