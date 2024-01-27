contract c40169{
   
  function transferFrom(address _caller, address _from, address _to, uint256 _amount) onlyAsset returns (bool success) {
    assert(allowTransactions);
    assert(!frozenAccount[_caller]);
    assert(!frozenAccount[_from]);
    assert(balanceOf[_from] >= _amount);
    assert(balanceOf[_to] + _amount >= balanceOf[_to]);
    assert(_amount <= allowance[_from][_caller]);
    balanceOf[_from] -= _amount;
    uint256 fee = feeFor(_from, _to, _amount);
    balanceOf[_to] += _amount - fee;
    treasuryBalance += fee;
    allowance[_from][_caller] -= _amount;
    activateAccount(_from);
    activateAccount(_to);
    activateAccount(_caller);
    Transfer(_from, _to, _amount);
    return true;
  }
}