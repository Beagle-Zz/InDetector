contract c7245{
    /**
     * @notice Approve `_value` tokens for `_spender`
     * @param _spender The address of the sender
     * @param _value the amount to send
     */
    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(checkVestingCondition(_spender));
        if(balances[msg.sender] >= _value) {
            approved[msg.sender][_spender] = _value;
            emit Approval(msg.sender, _spender, _value);
            return true;
        }
        return false;
    }
}