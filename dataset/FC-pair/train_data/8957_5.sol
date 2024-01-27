contract c8957{
    /// @notice Transfer tokens to account
    /// @dev Send '_value' amount of tokens to address '_to'
    /// @param _to The address of the recipient
    /// @param _value The token amount to send
    /// @return Whether succeed
    function transfer(address _to, uint256 _value) public returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
    }
}