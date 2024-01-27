contract c8957{
    /// @notice Set allowance for other address
    /// @dev Allows '_spender' to spend no more than '_value' tokens in your behalf. If this function is called again it overwrites the current allowance with _value
    /// @param _spender The address authorized to spend
    /// @param _value The max amount they can spend
    /// @return Whether succeed.
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
}