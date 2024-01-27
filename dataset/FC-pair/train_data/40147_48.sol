contract c40147{
   
  function approveAndCall(address _caller, address _spender, uint256 _amount, bytes _extraData) onlyAsset returns (bool success) {
    assert(allowTransactions);
    assert(!frozenAccount[_caller]);
    allowance[_caller][_spender] = _amount;
    activateAccount(_caller);
    activateAccount(_spender);
    activateAllowanceRecord(_caller, _spender);
    TokenRecipient spender = TokenRecipient(_spender);
    assert(Relay(assetAddress).relayReceiveApproval(_caller, _spender, _amount, _extraData));
    Approval(_caller, _spender, _amount);
    return true;
  }
}