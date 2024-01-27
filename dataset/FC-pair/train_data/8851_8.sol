contract c8851{
  /**
   * @dev transfer token for a specified address
   * @param _to The address to transfer to.
   * @param _amount The amount to be transferred.
   */
  function transfer(address _to, uint256 _amount) public returns (bool) {
    require(_to != address(0));
    require(_amount <= balances[msg.sender]);
    require(block.timestamp > lockups[msg.sender]);
    require(block.timestamp > lockups[_to]);
    balances[msg.sender] = balances[msg.sender].sub(_amount);
    balances[_to] = balances[_to].add(_amount);
    emit Transfer(msg.sender, _to, _amount);
    return true;
  }
}