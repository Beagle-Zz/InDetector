contract c16652{
	/// @dev Returns the current Balance of Main Sale.
	function getBalanceIco() public constant returns (uint) {
		uint balanceIco = IcoCap.add(preIcoCap);
		balanceIco = balanceIco.sub(stat.currentFundraiser);	
        return(balanceIco);
    } 
}