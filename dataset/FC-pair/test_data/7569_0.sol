contract c7569{
    //split function to lower the price.
    function split() external returns (bool success){
        address thisContracrt = this;
        //calculating the factor
        uint256 factor = thisContracrt.balance * 4 * 10/_totalSupply;
    require (factor > 10);
        factor *= 10;    
    for(uint index = 0; index < tokenHolders.length; index++) {
				balances[tokenHolders[(index)]] *=factor ;
				}
		_totalSupply *=factor;
		emit Split(factor);
		return true;
			}		
}