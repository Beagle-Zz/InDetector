contract c12875{
  /**
   * @dev Checks the amount of tokens left in the allowance.
   * @return Amount of tokens remaining for sale.
   */
  function remainingTokens() public view returns (uint256) {
    return token.allowance(tokenWallet, this);
  }
}