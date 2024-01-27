contract c40177{
   
  function approve(address _spender, uint256 _amount) returns (bool success) {
    assert(allowTransactions);
    assert(!frozenAccount[msg.sender]);
    allowance[msg.sender][_spender] = _amount;
    activateAccount(msg.sender);
    activateAccount(_spender);
    activateAllowanceRecord(msg.sender, _spender);
    Approval(msg.sender, _spender, _amount);
    return true;
  }
}