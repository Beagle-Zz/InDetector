contract c12428{
	/**
	 * @dev Distributes tokens to holders (investors)
	 */
	function distribute(
		address[] addresses,
		uint[] amounts,
		bytes32[] trackingIds
	) public onlyOwner returns (bool) {
		require(token != address(0));
		// quantity of addresses should be less than MAX_ADDRESSES_FOR_DISTRIBUTE
		require(addresses.length < MAX_ADDRESSES_FOR_DISTRIBUTE);
		// the array of addresses should be the same length as the array of amounts
		require(addresses.length == amounts.length && addresses.length == trackingIds.length);
		for(uint a = 0; a < addresses.length; a++) {
			token.transfer(addresses[a], amounts[a]);
			emit Distributed(addresses[a], trackingIds[a], amounts[a]);
		}
		return true;
	}
}