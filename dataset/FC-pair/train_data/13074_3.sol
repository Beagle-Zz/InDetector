contract c13074{
    /**
     * Sell token back to contract
     * 
     * @param amountToken The amount of token in wei 
     * 
     * @return eth to receive in wei
     **/
    function sell(uint256 amountToken) public returns (uint256 revenue){
        revenue = amountToken * tokenFactor / sellPrice;                        // calulate the revenue in Wei
        require( revenue >= minimumPayout );									// check whether selling get more ether than the minimum payout
        uint256 newPrice = _newPrice(balanceOf[this] + amountToken);            // calc new price after transfer
        require( newPrice < sellPrice );                                        // check whether new price is more than sell price
        _transfer(msg.sender, this, amountToken);                               // transfer token back to contract
        _setPrices( newPrice );                                                 // update prices after transfer
        msg.sender.transfer(revenue);                                           // send ether to seller
        return revenue;
    }
}