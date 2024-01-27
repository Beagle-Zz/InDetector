contract c13617{
  /**
   * @dev Increase the amount of tokens that an owner allowed to a spender.
   *
   * approve should be called when allowed[_spender] == 0. To increment
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * From MonolithDAO Token.sol
   * @param _spender The address which will spend the funds.
   * @param _addedValue The amount of tokens to increase the allowance by.
   */
  /*@CTK CtkIncreaseApprovalEffect
    @tag assume_completion
    @post __post.allowed[msg.sender][_spender] == allowed[msg.sender][_spender] + _addedValue
    @post __has_overflow == false
   */
  /* CertiK Smart Labelling, for more details visit: https://certik.org */
  function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
    allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue);
    emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }
}