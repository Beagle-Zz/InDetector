contract c11989{
	// This function check whether ICO is currently active or not
    function checkifCapHasReached() internal {
    	if (isPreTokenSaleActive() && (numberOfTokensAllocated > presalesCap))  
        	hasPreTokenSalesCapReached = true;
     	else if (isTokenSaleActive() && (numberOfTokensAllocated > (presalesCap + publicsalesCap)))     
        	hasTokenSalesCapReached = true;     	
    }
}