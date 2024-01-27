contract c3713{
    //  Transfer `value` ITTokens from sender's account
    // `msg.sender` to provided account address `to`.
    // @param _to The address of the recipient
    // @param _value The number of ITTokens to transfer
    // @return Whether the transfer was successful or not
    function transfer(address _to, uint _value) public returns (bool ok) {
        //validate receiver address and value.Not allow 0 value
        require(_to != 0 && _value > 0);
        uint256 senderBalance = balances[msg.sender];
        //Check sender have enough balance
        require(senderBalance >= _value);
        senderBalance = safeSub(senderBalance, _value);
        balances[msg.sender] = senderBalance;
        balances[_to] = safeAdd(balances[_to], _value);
        Transfer(msg.sender, _to, _value);
        return true;
    }
}