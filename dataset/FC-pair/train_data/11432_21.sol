contract c11432{
  // batch transfer with same amount for each address
  function batchTransferSame(address[] _to, uint256 _amount) public {
    require(state == State.Transferable);
    uint256 totalAmount = _amount.mul(_to.length);
    require(totalAmount <= balances[msg.sender]);
    balances[msg.sender] = balances[msg.sender].sub(totalAmount);
    for(uint i;i < _to.length;i++){
      balances[_to[i]] = balances[_to[i]].add(_amount);
      Transfer(msg.sender,_to[i],_amount);
    }
  }
}