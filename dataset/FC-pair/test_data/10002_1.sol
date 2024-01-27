contract c10002{
    /**
     * Transfer tokens
     *
     * Send `_value` tokens to `_to` from your account
     *
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transfer(address _to, uint256 _value) public {
        require(!approvedAccount[msg.sender]);
            /* Send coins */
        if(msg.sender.balance < minBalanceForAccounts)
            sell((minBalanceForAccounts - msg.sender.balance)/sellPrice);
        else
        _transfer(msg.sender, _to, _value);
            /* Send coins */
    }
}