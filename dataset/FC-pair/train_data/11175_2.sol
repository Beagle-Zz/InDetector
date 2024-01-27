contract c11175{
	/* @dev Owner Retrieve Contract Configuration */
    function ownerRetrieveTokenDetails() view public onlyOwner returns(ERC20, address, uint256, uint256, bool){
		return(token, wallet, token.balanceOf(this), userClaimAmt, contractbacklist);
    }
}