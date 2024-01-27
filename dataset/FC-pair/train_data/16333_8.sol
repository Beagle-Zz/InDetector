contract c16333{
	/// @notice Sell metadollars and receive ether from contract
	function sell(uint256 amount) {
		require(!frozenAccount[msg.sender]);
		require(tokenBalanceOf[msg.sender] >= amount);         	// checks if the sender has enough to sell
		require(amount > 0);
		require(sellPrice > 0);
		_transfer(msg.sender, this, amount);
		uint256 revenue = amount * sellPrice;
		require(this.balance >= revenue);
	    uint commission = msg.value/sellCommission; // Sell Commission 0.2% of wei tx
        require(address(this).send(commission));
		msg.sender.transfer(revenue);         // sends ether to the seller: it's important to do this last to prevent recursion attacks
	}
}