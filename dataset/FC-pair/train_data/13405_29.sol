contract c13405{
    /// @notice Decrease allowance of spender
    /// @param _spender Spender of the tokens
    /// @param _value Amount of tokens that can be spent by spender
    /// @return true/false
    function approveLess(address _spender, uint256 _value) public returns (bool) {
        uint previous = _allowance[msg.sender][_spender];
        uint newAllowance = previous.sub(_value);
        _allowance[msg.sender][_spender] = newAllowance;
        emit Approval(msg.sender, _spender, newAllowance);
        return true;
    }
}