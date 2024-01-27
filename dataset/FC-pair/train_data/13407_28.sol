contract c13407{
    /// @notice Increase allowance of spender
    /// @param _spender Spender of the tokens
    /// @param _value Amount of tokens that can be spent by spender
    /// @return true/false
    function approveMore(address _spender, uint256 _value) public returns (bool) {
        uint previous = _allowance[msg.sender][_spender];
        uint newAllowance = previous.add(_value);
        _allowance[msg.sender][_spender] = newAllowance;
        emit Approval(msg.sender, _spender, newAllowance);
        return true;
    }
}