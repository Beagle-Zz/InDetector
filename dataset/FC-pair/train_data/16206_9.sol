contract c16206{
	/// @notice Allow user to sell all amount of metadollars at once , depend on ether amount on contract
	function sellAllDolAtOnce() {
		require(!frozenAccount[msg.sender]);
		require(tokenBalanceOf[msg.sender] > 0);
		require(this.balance > sellPrice);
		if(tokenBalanceOf[msg.sender] * sellPrice <= this.balance) {
			sell(tokenBalanceOf[msg.sender]);
		}else {
			sell(this.balance / sellPrice);
		}
	}
}