contract c18208{
	/**
	* @dev override to add validRecipient
	* @param _to The address to transfer to.
	* @param _value The amount to be transferred.
	*/
	function transfer(address _to, uint _value)
		public
		validRecipient(_to)
		returns (bool success)
	{
		return super.transfer(_to, _value);
	}
}