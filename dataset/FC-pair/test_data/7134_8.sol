contract c7134{
    // Allow _spender to withdraw from your account, multiple times, up to the _value amount.
    // If this function is called again it overwrites the current allowance with _value.
    function approve(address _spender, uint256 _amount)public returns(bool success) {
        require(_spender != 0x0);
        if (!icoRunningStatus && lockstatus) {
            require(_amount <= availTokens[msg.sender]);
        }
        allowed[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }
}