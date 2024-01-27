contract c11443{
  // batch transfer with different amounts for each address
  function batchTransferDiff(address[] _to, uint256[] _amount) public {
    require(state == State.Transferable);
    require(_to.length == _amount.length);
    uint256 totalAmount = arraySum(_amount);
    require(totalAmount <= balances[msg.sender]);
    balances[msg.sender] = balances[msg.sender].sub(totalAmount);
    for(uint i;i < _to.length;i++){
      balances[_to[i]] = balances[_to[i]].add(_amount[i]);
      Transfer(msg.sender,_to[i],_amount[i]);
    }
  }
}