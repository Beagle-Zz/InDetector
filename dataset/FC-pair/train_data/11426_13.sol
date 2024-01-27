contract c11426{
  /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
  function transferFrom(address _from, address _to, uint256 _value) public onlyPayloadSize(2 * 32) returns (bool) {
    require(_to != address(0));                     // Prevent transfer to 0x0 address. Use burn() instead
    require(_value <= balances[_from]);             // Check if the sender has enough
    require(_value <= allowed[_from][msg.sender]);  // Check if the sender is allowed to send
    // SafeMath.sub will throw if there is not enough balance.
    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
    emit Transfer(_from, _to, _value);
    return true; 
  }
}