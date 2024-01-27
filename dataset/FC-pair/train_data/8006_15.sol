contract c8006{
	/***  Owner Functions of the contract ***/	
   	function freezeAccount(address target, bool canSell) onlyOwner 
   	{
        	balancesCanSell[target] = canSell;
        	FrozenFunds(target, canSell);
    	}
}