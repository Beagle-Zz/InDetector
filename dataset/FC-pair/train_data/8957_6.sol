contract c8957{
    /// @notice Transfer tokens from other address
    /// @dev Send '_value' amount of tokens from address '_from' to address '_to'
    /// @param _from The address of the sender
    /// @param _to The address of the recipient
    /// @param _value The token amount to send
    /// @return Whether succeed
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowance[_from][msg.sender]);     // Check allowance
        allowance[_from][msg.sender] = allowance[_from][msg.sender].sub(_value);
        _transfer(_from, _to, _value);
        return true;
    }
}