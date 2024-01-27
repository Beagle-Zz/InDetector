contract c11175{
	/* @dev Owner Retrieve Contract Configuration */
    function ownerRetrieveContractConfig2() view public onlyOwner returns(uint256, bool, uint, uint, uint, uint, uint256, uint, bool){
		return(mineth, paidversion, payStyle, startTimes, endTimes, payoutNow, fixPayAmt, maxSignup, allowsSignup);
    }
}