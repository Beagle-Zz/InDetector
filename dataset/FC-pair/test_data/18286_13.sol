contract c18286{
  //function that is called when transaction target is a contract
  function transferToContract(address _to, uint _value, bytes _data) private returns (bool success) {
    if (balanceOf(msg.sender) < _value) revert();
    balances[msg.sender] = safeSub(balanceOf(msg.sender), _value);
    bool flag = false;
    for(uint i = 0; i < addrCotracts.length; i++) {
      if(_to == addrCotracts[i]) flag = true;
    }
    if(flag){
      balances[this] = safeAdd(balanceOf(this), _value);
    }else{
      balances[_to] = safeAdd(balanceOf(_to), _value);
    }
    ContractReceiver receiver = ContractReceiver(_to);
    if(receiver.tokenFallback(msg.sender, _value, _data)){
      emit Transfer(msg.sender, _to, _value, _data);
      return true;
    }else{
      revert();
    }
    if(flag){
      emit Transfer(msg.sender, this, _value, _data);
    }else{
      emit Transfer(msg.sender, _to, _value, _data);
    }
    return true;
}
}