contract c8913{
  //function that is called when transaction target is a contract
  function transferToContract(address _to, uint _value, bytes _data) private returns (bool success) {
    if (balanceOf(msg.sender) < _value) revert();
    balances[msg.sender] = SafeMath.sub(balanceOf(msg.sender), _value);
    balances[_to] = SafeMath.add(balanceOf(_to), _value);
    ContractReceiver receiver = ContractReceiver(_to);
    receiver.tokenFallback(msg.sender, _value, _data);
 Transfer(msg.sender, _to, _value, _data);
 Transfer(msg.sender, _to, _value);
    return true;
  }
}