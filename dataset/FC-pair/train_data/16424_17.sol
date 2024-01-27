contract c16424{
    /// @dev transfer token for a specified address
    /// @param _to address The address to transfer to.
    /// @param _value uint256 The amount to be transferred.
    /// @return success bool Calling super.transfer and returns true if successful.
    function transfer(address _to, uint256 _value) public whenNotMinting returns (bool) {
	    return super.transfer(_to, _value);
    }
}