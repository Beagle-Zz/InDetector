contract c8984{
	/**
     * Destroy tokens
     *
     * Remove `_value` tokens from the system irreversibly
     *
     * @param _value the amount of money to burn
     */
	function burn(uint256 _value) public returns (bool success) {
	    if (logic.burn(msg.sender, _value) == true) {
	        emit Burn(msg.sender, _value);
	        return true;
	    }
	}
}