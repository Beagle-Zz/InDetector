contract c8984{
	/**
     * Transfer tokens from other address
     *
     * Send `_value` tokens to `_to` in behalf of `_from`
     *
     * @param _from The address of the sender
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
	function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
	    if (logic.transferFrom(_from, msg.sender, _to, _value) == true) {
	        emit Transfer(_from, _to, _value);
	        return true;
	    }
	}
}