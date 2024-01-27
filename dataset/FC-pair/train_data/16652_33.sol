contract c16652{
	/// @dev Returns the current price.
	/// @param _amount the amount of ether
    function EthToAFW(uint _amount) public view returns (uint256 tokens) {
		if(isPreSale()){	
			return computeTokenAmount(_amount);
		} else if (isMainSale()) {
			return _amount.mul(tokenRate);
		} else {
            return 0;
        }
    }      
}