contract c11403{
  // Transfer tokens from owner address
  function transfer(address _to, uint _value) public returns (bool success) {
    require(_to != 0x0);
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
    return true;
  }
}