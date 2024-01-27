contract c13593{
  /**
   * @dev Transfers tokens to a specific address
   * @param _to address The address to transfer tokens to
   * @param _value unit256 The amount to be transferred
   */
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);
    // Subtract first
    balances[msg.sender] = balances[msg.sender].sub(_value);
    // Now add tokens
    balances[_to] = balances[_to].add(_value);
    // Notify that a transfer has occurred
    Transfer(msg.sender, _to, _value);
    return true;
  }
}