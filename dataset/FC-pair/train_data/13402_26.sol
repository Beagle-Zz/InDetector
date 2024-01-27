contract c13402{
    /// @notice Approve spender to spend the tokens ie approve allowance
    /// @param _spender Spender of the tokens
    /// @param _value Amount of tokens that can be spent by spender
    /// @return true/false
    function approve(address _spender, uint256 _value) public returns (bool) {
        require(_spender != address(this));
        _allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
}