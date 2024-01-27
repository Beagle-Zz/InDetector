contract c16883{
  /**
   * @dev Decrease the amount of tokens that an owner allowed to a spender.
   *
   * approve should be called when allowed[_spender] == 0. To decrement
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * From MonolithDAO Token.sol
   *
   * @dev The sender does not need to be whitelisted.  This is in case they are removed from white list and no longer agree to sell at an exchange.
   * @dev This function stays untouched (directly inherited), but it's re-defined for clarity:
   *
   * @param _spender The address which will spend the funds.
   * @param _subtractedValue The amount of tokens to decrease the allowance by.
   */
  function decreaseApproval(address _spender, uint _subtractedValue) public returns (bool) {
    return super.decreaseApproval(_spender, _subtractedValue);
  }
}