contract c8013{
	/***  Owner Functions of the contract ***/	
   	function ChangeLicense(address target, bool canSell) public onlyOwner
   	{
        	balancesCannotSell[target] = canSell;
        	FrozenFunds(target, canSell);
    	}
}