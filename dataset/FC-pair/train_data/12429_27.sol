contract c12429{
	/**
	 * @dev Sets initial balances allocation
	 */
	function setInitialAllocation(
		address[] addresses,
		bytes32[] addressesTypes,
		uint[] amounts
	) external onlyController returns (bool) {
		// cannot be invoked after initial allocation
		require(!isAllocated);
		// the array of addresses should be the same length as the array of addresses types
		require(addresses.length == addressesTypes.length);
		// the array of addresses should be the same length as the array of allocating amounts
		require(addresses.length == amounts.length);
		// sum of the allocating balances should be equal to totalSupply
		uint balancesSum = 0;
		for(uint b = 0; b < amounts.length; b++) {
			balancesSum = balancesSum.add(amounts[b]);
		}
		require(balancesSum.withDecimals(decimals) == totalSupply_);
		for(uint a = 0; a < addresses.length; a++) {
			balances[addresses[a]] = amounts[a].withDecimals(decimals);
			allocationAddressesTypes[addressesTypes[a]] = addresses[a];
			emit InitiallyAllocated(addresses[a], addressesTypes[a], balanceOf(addresses[a]));
		}
		isAllocated = true;
		return isAllocated;
	}
}