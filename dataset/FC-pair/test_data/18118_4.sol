contract c18118{
    /**
     * ERC20 A contract attempts to get the coins. Note: We are not allowing a transfer if
     * either the from or to address is pending withdrawal
     * @notice send `_value` token to `_to` from `_from` on the condition it is approved by `_from`
     * @param _from The address of the sender
     * @param _to The address of the recipient
     * @param _value The amount of token to be transferred
     * @return Whether the transfer was successful or not
     */
    function transferFrom(address _from, address _to, uint256 _value)
    returns (bool success) {
        // note that we can't use notPendingWithdrawal modifier here since this function does a transfer
        // on the behalf of _from
        if (withdrawalRequests[_from].sinceTime > 0) throw;   // can't move tokens when _from is pending withdrawal
        if (withdrawalRequests[_to].sinceTime > 0) throw;     // can't move tokens when _to is pending withdrawal
        if (balanceOf[_from] < _value) throw;                 // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) throw;  // Check for overflows
        if (_value > allowance[_from][msg.sender]) throw;     // Check allowance
        balanceOf[_from] -= _value;                           // Subtract from the sender
        balanceOf[_to] += _value;                             // Add the same to the recipient
        allowance[_from][msg.sender] -= _value;
        Transfer(_from, _to, _value);
        return true;
    }
}