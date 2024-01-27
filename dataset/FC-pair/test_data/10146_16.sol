contract c10146{
	/**
	 * @dev Function that accepts ether value and returns the token amount
	 *
	 * @param value Amount of ethers sent
	 *
	 * @return checks various conditions and returns the bool result indicating validity.
	 */
	function calculate(uint256 value) public constant returns (uint256) {
		uint256 tokenDecimals = token.decimals();
		uint256 tokens = value.mul(10 ** tokenDecimals).div(tokenPriceInEth);
		return tokens;
	}
}