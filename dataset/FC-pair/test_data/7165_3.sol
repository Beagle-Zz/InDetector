contract c7165{
	// ---------------------------
	//  Only Owner functions
	// ---------------------------
	function uploadStartlist(uint[] prices) public onlyOwner beforeDeadline returns (bool success){
		require(prices.length == 176);	
		for (uint i; i < prices.length; i++){
			riders[i + 1].price = prices[i];
		}
		startlistUploaded = true;
		return true;
	}
}