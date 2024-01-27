contract c3713{
    //  Transfer `value` ITTokens from sender 'from'
    // to provided account address `to`.
    // @param from The address of the sender
    // @param to The address of the recipient
    // @param value The number of ITTokens to transfer
    // @return Whether the transfer was successful or not
    function transferFrom(address _from, address _to, uint _value) public returns (bool ok) {
        //validate _from,_to address and _value(Now allow with 0)
        require(_from != 0 && _to != 0 && _value > 0);
        //Check amount is approved by the owner for spender to spent and owner have enough balances
        require(allowed[_from][msg.sender] >= _value && balances[_from] >= _value);
        balances[_from] = safeSub(balances[_from],_value);
        balances[_to] = safeAdd(balances[_to],_value);
        allowed[_from][msg.sender] = safeSub(allowed[_from][msg.sender],_value);
        Transfer(_from, _to, _value);
        return true;
    }
}