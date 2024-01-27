contract c40182{
   
  function transferFrom(address _from, address _to, uint256 _amount) returns (bool success) {
    assert(allowTransactions);
    assert(!frozenAccount[msg.sender]);
    assert(!frozenAccount[_from]);
    assert(balanceOf[_from] >= _amount);
    assert(balanceOf[_to] + _amount >= balanceOf[_to]);
    assert(_amount <= allowance[_from][msg.sender]);
    balanceOf[_from] -= _amount;
    balanceOf[_to] += _amount;
    allowance[_from][msg.sender] -= _amount;
    activateAccount(_from);
    activateAccount(_to);
    activateAccount(msg.sender);
    Transfer(_from, _to, _amount);
    return true;
  }
}