contract c40168{
   
   
  function transfer(address _to, uint256 _amount) returns (bool success) {
    assert(allowTransactions);
    assert(!frozenAccount[msg.sender]);
    assert(balanceOf[msg.sender] >= _amount);
    assert(balanceOf[_to] + _amount >= balanceOf[_to]);
    activateAccount(msg.sender);
    activateAccount(_to);
    balanceOf[msg.sender] -= _amount;
    if (_to == address(this)) treasuryBalance += _amount;
    else balanceOf[_to] += _amount;
    Transfer(msg.sender, _to, _amount);
    return true;
  }
}