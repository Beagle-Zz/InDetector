contract c18208{
	/**
	* @dev override to add validRecipient
	* @param _spender The address which will spend the funds.
	* @param _value The amount of tokens to be spent.
	*/
	function approve(address _spender, uint256 _value)
		public
		validRecipient(_spender)
		returns (bool)
	{
		return super.approve(_spender,  _value);
	}
}