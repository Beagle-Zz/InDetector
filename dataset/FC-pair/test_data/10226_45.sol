contract c10226{
  /**
   * @dev Decrease the amount of tokens that an owner allowed to a spender.
   *
   * approve should be called when allowed[_spender] == 0. To decrement
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * From MonolithDAO Token.sol
   * @param _spender The address which will spend the funds.
   * @param _subtractedValue The amount of tokens to decrease the allowance by.
   */
  function decreaseApproval(address _spender, uint _subtractedValue) public returns (bool) {
    uint oldValue = allowance(msg.sender, _spender);
    if (_subtractedValue > oldValue) {
      setAllowance(msg.sender, _spender, 0);
    } else {
      setAllowance(msg.sender, _spender, oldValue.sub(_subtractedValue));
    }
    emit Approval(msg.sender, _spender, allowance(msg.sender, _spender));
    return true;
  }
}