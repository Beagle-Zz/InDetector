contract c40147{
   
  function approveAndCall(address _spender, uint256 _amount, bytes _extraData) returns (bool success) {
    assert(allowTransactions);
    assert(!frozenAccount[msg.sender]);
    allowance[msg.sender][_spender] = _amount;
    activateAccount(msg.sender);
    activateAccount(_spender);
    activateAllowanceRecord(msg.sender, _spender);
    TokenRecipient spender = TokenRecipient(_spender);
    spender.receiveApproval(msg.sender, _amount, this, _extraData);
    Approval(msg.sender, _spender, _amount);
    return true;
  }
}