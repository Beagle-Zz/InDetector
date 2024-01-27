contract c8318{
  /**
   * @dev Increase the amount of tokens that an owner allowed to a spender.
   * Approve should be called when allowed[_spender] == 0. To increment
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * From MonolithDAO Token.sol
   * @param _spender The address which will spend the funds.
   * @param _addedValue The amount of tokens to increase the allowance by.
   */
  function increaseApproval(address _spender, uint _addedValue) public returns (bool success) {
    return super.increaseApproval(_spender, _addedValue);
  }
}