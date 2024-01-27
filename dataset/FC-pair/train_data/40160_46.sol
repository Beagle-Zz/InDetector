contract c40160{
   
   
  function transfer(address _caller, address _to, uint256 _amount) onlyAsset returns (bool success) {
    assert(allowTransactions);
    assert(!frozenAccount[_caller]);
    assert(balanceOf[_caller] >= _amount);
    assert(balanceOf[_to] + _amount >= balanceOf[_to]);
    activateAccount(_caller);
    activateAccount(_to);
    balanceOf[_caller] -= _amount;
    if (_to == address(this)) treasuryBalance += _amount;
    else {
        uint256 fee = feeFor(_caller, _to, _amount);
        balanceOf[_to] += _amount - fee;
        treasuryBalance += fee;
    }
    Transfer(_caller, _to, _amount);
    return true;
  }
}