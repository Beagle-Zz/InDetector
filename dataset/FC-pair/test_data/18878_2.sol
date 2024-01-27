contract c18878{
	/**
     * Set allowance for other address
     *
     * Allows `_spender` to spend no more than `_value` tokens on your behalf
     *
     * @param _spender The address authorized to spend
     * @param _value the max amount they can spend
     */
    function approve(address _spender, uint256 _value)
    	public
    	returns (bool success)
    {
		// To change the approve amount you first have to reduce the addresses`
        //  allowance to zero by calling `approve(_spender,0)` if it is not
        //  already 0 to mitigate the race condition described here:
        //  https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
		require((_value == 0) || (allowed[msg.sender][_spender] == 0));
      	//set allowance
      	allowed[msg.sender][_spender] = _value;
		//trigger event
      	Approval(msg.sender, _spender, _value);
		return true;
    }
}