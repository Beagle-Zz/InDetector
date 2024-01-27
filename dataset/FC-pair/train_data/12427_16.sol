contract c12427{
	/**
	 * @dev Refunds tokens for all voters
	 */
	function refundTokens(address to) public onlyOwner returns (bool) {
		if(to != address(0)) {
			return _refundTokens(to);
		}
		for(uint256 i = 0; i < voters.length; i++) {
			_refundTokens(voters[i]);
		}
		return true;
	}
}