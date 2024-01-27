contract c18207{
	/**
	* @dev override to add validRecipient
	* @param _from address The address which you want to send tokens from
	* @param _to address The address which you want to transfer to
	* @param _value uint256 the amount of tokens to be transferred
	*/
	function transferFrom(address _from, address _to, uint256 _value)
		public
		validRecipient(_to)
		returns (bool)
	{
		return super.transferFrom(_from, _to, _value);
	}
}