contract c16230{
	/// @notice Sell all of tokens for all ether of this smartcontract
	function getAllMyTokensForAllEtherOnContract() {
		require(icoExitIsPossible);
		require(!frozenAccount[msg.sender]);
		require(tokenBalanceOf[msg.sender] > 0);         	// checks if the sender has enough to sell
		require(currentTokenPrice > 1);
		uint256 amount = tokenBalanceOf[msg.sender] ;
		uint256 revenue = amount * currentTokenPrice / 2;
		require(this.balance <= revenue);
		_transfer(msg.sender, this, amount);
		msg.sender.transfer(this.balance); 
	}
}