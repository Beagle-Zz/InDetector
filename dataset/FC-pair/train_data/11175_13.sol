contract c11175{
	/***************************/
	/* Query Display Function **/
	/***************************/
    function adminRetrieveContractConfig() view public onlyStaffs returns(uint, uint, uint256, uint, bool, bool){
		return(payStyle, payoutNow, fixPayAmt, maxSignup, allowsSignup, paidversion);
    }
}