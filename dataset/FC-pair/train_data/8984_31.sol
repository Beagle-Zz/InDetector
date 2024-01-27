contract c8984{
	/**
     * Destroy tokens from other account
     *
     * Remove `_value` tokens from the system irreversibly on behalf of `_from`.
     *
     * @param _from the address of the sender
     * @param _value the amount of money to burn
     */
	function burnFrom(address _from, uint256 _value) public returns (bool success) {
	    if (logic.burnFrom( _from, msg.sender, _value) == true) {
	        emit Burn(_from, _value);
	        return true;
	    }
	}
}