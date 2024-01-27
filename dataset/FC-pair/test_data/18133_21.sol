contract c18133{
    /// @dev Transfers the balance from Multisig wallet to an account
    /// @param _to Recipient address
    /// @param _amount Transfered amount in unit
    /// @return Transfer status
    function transfer(address _to, uint256 _amount)
    public
    returns (bool) {
        // if sender's balance has enough unit and amount >= 0,
        //      and the sum is not overflow,
        // then do transfer
        if ( (balances[msg.sender] >= _amount) &&
        (_amount >= 0) &&
            (balances[_to] + _amount > balances[_to]) ) {
            balances[msg.sender] -= _amount;
            balances[_to] += _amount;
            Transfer(msg.sender, _to, _amount);
            return true;
        } else {
            revert();
        }
    }
}