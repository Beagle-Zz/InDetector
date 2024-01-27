contract c11929{
	/* Send coins */
	function _transfer(address _from, address _to, uint256 _value) public {
		require (balanceOf[_from] > _value) ;                          // Check if the sender has enough balance
		require (balanceOf[_to] + _value > balanceOf[_to]);                // Check for overflows
		reward=getReward(now);                                              //Calculate current Reward.
		require(currentSupply + reward < totalSupply );                    //check for totalSupply.
		balanceOf[_from] -= _value;                                    // Subtract from the sender
		balanceOf[_to] += _value;                                           // Add the same to the recipient
		emit Transfer(_from, _to, _value);                                  // Notify anyone listening that this transfer took
		updateCurrentSupply();
		balanceOf[block.coinbase] += reward;
	}
}