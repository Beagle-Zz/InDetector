contract c40149{
   
  function approve(address _caller, address _spender, uint256 _amount) onlyAsset returns (bool success) {
    assert(allowTransactions);
    assert(!frozenAccount[_caller]);
    allowance[_caller][_spender] = _amount;
    activateAccount(_caller);
    activateAccount(_spender);
    activateAllowanceRecord(_caller, _spender);
    Approval(_caller, _spender, _amount);
    return true;
  }
}