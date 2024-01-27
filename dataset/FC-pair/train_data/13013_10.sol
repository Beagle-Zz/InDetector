contract c13013{
  // function that is called when transaction target is an address
  function transferToAddress(address _to, uint _value, bytes _data) private returns (bool success) {
    if (balanceOf(msg.sender) < _value) revert();
    balances[msg.sender] = SafeMath.sub(balanceOf(msg.sender), _value);
    balances[_to] = SafeMath.add(balanceOf(_to), _value);
    Transfer(msg.sender, _to, _value, _data);
    Transfer(msg.sender, _to, _value);
    return true;
  }
}