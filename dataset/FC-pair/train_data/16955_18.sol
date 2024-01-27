contract c16955{
	// Transfer tokens from the vested address. 50% available 12/01/2018, the rest available 06/01/2019
	function transferFromVest(uint256 _amount) public onlyOwner {
		require(block.timestamp > firstVestStartsAt);
		require(crowdsaleFinalized == true);
		require(_amount > 0);
		if(block.timestamp > secondVestStartsAt) {
			// all tokens available for vest withdrawl
			require(_amount <= teamSupply);
			require(_amount <= balanceOf(teamSupplyAddress));
		} else {
			// only first vest available
			require(_amount <= (firstVestAmount - currentVestedAmount));
			require(_amount <= balanceOf(teamSupplyAddress));
		}
		currentVestedAmount = currentVestedAmount.add(_amount);
		addToBalance(msg.sender, _amount);
		decrementBalance(teamSupplyAddress, _amount);
		Transfer(teamSupplyAddress, msg.sender, _amount);
	}
}