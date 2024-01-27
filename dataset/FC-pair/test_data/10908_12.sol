contract c10908{
// Send `_value` tokens to `_to` from msg.sender
 function transfer(address _to, uint256 _value) public whenNotPaused returns (bool) {
    require( _value > 0 );
    require(_to != address(0)); 
    require(msg.sender != _to );// forbit to transfer to himself
    require(balanceOf[msg.sender] >= _value);
    require(SafeMath.add(balanceOf[_to],_value) > balanceOf[_to]);  //SafeMath pretect not overflow
    require(!frozenAccount[msg.sender]);
    require(!frozenAccount[_to]);
    uint256 previousBalances = balanceOf[msg.sender] + balanceOf[_to]; 
    balanceOf[msg.sender] = SafeMath.sub(balanceOf[msg.sender],_value);
    balanceOf[_to] = SafeMath.add(balanceOf[_to],_value);
    emit Transfer(msg.sender, _to, _value);
    // Asserts are used to use static analysis to find bugs in your code. They should never fail
    assert(balanceOf[msg.sender] + balanceOf[_to] == previousBalances);
    return true;
  }
}