contract c16230{
	/// @notice Sell tokens and receive ether from contract
	function sell(uint256 amount) {
		require(!frozenAccount[msg.sender]);
		require(tokenBalanceOf[msg.sender] >= amount); //checks if the sender has enough to sell
		require(amount > 0);
		require(sellPrice > 0);
		sellCommission = msg.value/1000; // Sell Commission x1000 of wei tx
        require(address(this).send(buyCommission));
		_transfer(msg.sender, this, amount);
		uint256 revenue = amount * sellPrice;
		require(this.balance >= revenue);
		msg.sender.transfer(revenue);                		// sends ether to the seller: it's important to do this last to prevent recursion attacks
	}
}