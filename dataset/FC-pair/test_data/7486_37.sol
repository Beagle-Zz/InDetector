contract c7486{
  /// @dev Overrides parent by storing balances in timelock contract instead of issuing tokens right away.
  /// @param _beneficiary Token purchaser
  /// @param _tokenAmount Amount of tokens purchased
  function _processPurchase(address _beneficiary, uint256 _tokenAmount)
    internal
  {
    // Lock beneficiary's tokens
    tokenLock.lockTokens(_beneficiary, 1 weeks, _tokenAmount);
  }
}