contract c7569{
// Burn function
  function burn(uint256 _value) external returns (bool success){
    require(_value > 0);
    require(_value <= balances[msg.sender]);
    require(_totalSupply-_value>=300000000000000000000);
    balances[msg.sender] = balances[msg.sender].sub(_value);
    _totalSupply = _totalSupply.sub(_value);
    emit Burn(msg.sender, _value);
    emit Transfer(msg.sender, address(0), _value);
    return true;
  }
}