contract c13250{
//-------------------------------------------------------------------------------------
//from StandardToken
    function super_transfer(address _to, uint _value) /*public*/ internal returns (bool success) {
        require(!isSendingLocked[msg.sender]);
        require(_value <= oneTransferLimit);
        require(balances[msg.sender] >= _value);
        if(msg.sender == contrInitiator) {
            //no restricton
        } else {
            require(!isAllTransfersLocked);  
            require(safeAdd(getLast24hSendingValue(msg.sender), _value) <= oneDayTransferLimit);
        }
        balances[msg.sender] = safeSub(balances[msg.sender], _value);
        balances[_to] = safeAdd(balances[_to], _value);
        uint tc=transferInfo[msg.sender].tc;
        transferInfo[msg.sender].ti[tc].value = _value;
        transferInfo[msg.sender].ti[tc].time = now;
        transferInfo[msg.sender].tc = safeAdd(transferInfo[msg.sender].tc, 1);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}