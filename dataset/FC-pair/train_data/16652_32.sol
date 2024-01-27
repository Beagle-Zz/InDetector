contract c16652{
	/// @dev Returns the current price for 1 ether.
    function price() public view returns (uint256 tokens) {
		uint _amount = 1 ether;
		if(isPreSale()){	
			return computeTokenAmount(_amount);
		} else if (isMainSale()) {
			return _amount.mul(tokenRate);
		} else {
            return 0;
        }
    }
}