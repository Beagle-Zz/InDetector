contract c13074{
	/**
	 * Called when token are bought by sending ether
	 * 
	 * @return amount amount of token bought
	 **/
	function buy() payable public returns (uint256 amountToken){
        amountToken = msg.value * buyPrice / tokenFactor;                       // calculates the amount of token
        uint256 newPrice = _newPrice(balanceOf[this] - amountToken);            // calc new price after transfer
        require( (2*newPrice) > sellPrice);                                     // check whether new price is not lower than sqrt(2) of old one
        _transfer(this, msg.sender, amountToken);                               // transfer token from contract to buyer
        _setPrices( newPrice );                                                 // update prices after transfer
        return amountToken;
    }
}