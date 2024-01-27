contract c3078{
  /**
   * Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
   * 
   * param _spender The address which will spend the funds.
   * param _value The amount of tokens to be spent.
   */
  function approve(address _spender, uint256 _value) public returns (bool) {
    require(allowance[msg.sender][_spender]==0);
    allowance[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }
}