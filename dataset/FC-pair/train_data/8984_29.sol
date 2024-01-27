contract c8984{
	/**
     * Set allowance for other address and notify
     *
     * Allows `_spender` to spend no more than `_value` tokens in your behalf, and then ping the contract about it
     *
     * @param _spender The address authorized to spend
     * @param _value the max amount they can spend
     * @param _extraData some extra information to send to the approved contract
     */
	function approveAndCall(address _spender, uint256 _value, bytes _extraData) public returns (bool success) {
	    return logic.approveAndCall(_spender, msg.sender, this, _value, _extraData);
	}
}