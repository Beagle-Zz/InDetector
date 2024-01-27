contract c7390{
	/**
	 * @dev Allows the owner make a reward.
	 * @param _beneficiary the beneficiary address
	 * @param _value the tokens reward in wei
	 */
	function reward(address _beneficiary, uint256 _value) public onlyOwner {
		require(brokerImp.reward(_beneficiary, _value));
		emit Reward(_beneficiary, _value);
	}
}