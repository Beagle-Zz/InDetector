contract c7165{
    // ---------------------------
	//  Private functions
	// ---------------------------
    function transferPlayerBudget(address playerAddress) private returns (bool success){
    	return ERC20Interface(diipCoinContract).transfer(playerAddress, playerBudget);
    }
}