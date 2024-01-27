contract c3596{
  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);
    // SafeMath.sub will throw if there is not enough balance.
    if(!isContract(_to)){
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    Transfer(msg.sender, _to, _value);
    return true;}
    else{
        balances[msg.sender] = balanceOf(msg.sender).sub(_value);
    balances[_to] = balanceOf(_to).add(_value);
    NVTReceiver receiver = NVTReceiver(_to);
    receiver.NVTFallback(msg.sender, _value, 0);
    Transfer(msg.sender, _to, _value);
        return true;
    }
  }
}