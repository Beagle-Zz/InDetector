contract c18878{
  	/**
     * Transfer tokens from other address
     *
     * Send `_value` tokens to `_to` on behalf of `_from`
     *
     * @param _from The address of the sender
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transferFrom(address _from, address _to, uint256 _value)
    	public
    	returns (bool success)
    {
		// Check allowance
    	require(_value <= allowed[_from][msg.sender]);
		//decrement allowance
		allowed[_from][msg.sender] -= _value;
    	//transfer tokens
        return _transfer(_from, _to, _value);
    }
}