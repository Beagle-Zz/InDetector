contract c10202{
    /// @notice Send `_value` tokens to `_to` from your account
    /// @param _to The address of the recipient
    /// @param _value the amount to send
    function transfer(address _to, uint256 _value) returns (bool success) {
        _transfer(msg.sender, _to, _value);
		return true;
    }
}