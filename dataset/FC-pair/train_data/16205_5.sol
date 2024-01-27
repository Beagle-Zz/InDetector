contract c16205{
	// Function that returns the (dynamic) price of a single token.
	function price(bool buyOrSell) public constant returns (uint) {
        if(buyOrSell){
        	return getTokensForEther(1 finney);
        }else{
        	uint256 eth = getEtherForTokens(1 finney);
	        uint256 fee = fluxFeed(eth, false, false);
	        return eth - fee;
        }
    }
}