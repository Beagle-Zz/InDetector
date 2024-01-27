contract c11989{
	//This function is used refund contribution of a contributor in case soft cap is not reached or audit of an contributor failed
	function refundContribution(address _contributor, uint256 _weiAmount) public onlyOwner returns (bool) {
		require(_contributor != 0);                                                                                                                                     
		if (!_contributor.send(_weiAmount)) {
			return false;
		} else {
			contributors[_contributor] = 0;
			return true;
		}
	}
}