contract c16963{
	/**
	returns the base discount value
	@param  currentsupply is a 'current supply' value
	@param  contribution  is 'sent by the contributor'
	@return   an integer for getting the discount value of the base discounts
	**/
	function baseDiscounts(uint256 currentsupply,uint256 contribution,string types) returns (uint256){
		if(contribution==0) throw;
		if(keccak256("ethereum")==keccak256(types)){
			if(currentsupply>=0 && currentsupply<= 15*(10**5) * (10**18) && contribution>=1*10**18){
			 return 40;
			}else if(currentsupply> 15*(10**5) * (10**18) && currentsupply< 30*(10**5) * (10**18) && contribution>=5*10**17){
				return 30;
			}else{
				return 0;
			}
			}else if(keccak256("bitcoin")==keccak256(types)){
				if(currentsupply>=0 && currentsupply<= 15*(10**5) * (10**18) && contribution>=45*10**5){
				 return 40;
				}else if(currentsupply> 15*(10**5) * (10**18) && currentsupply< 30*(10**5) * (10**18) && contribution>=225*10**4){
					return 30;
				}else{
					return 0;
				}
			}	
	}
}