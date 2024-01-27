contract c10165{
  /**
   * @notice Override HolderBase.deliverTokens
   * @param _token ERC20Basic token contract
   * @param _beneficiary Address to receive tokens
   * @param _tokens Amount of tokens
   */
  function deliverTokens(ERC20Basic _token, address _beneficiary, uint256 _tokens) internal {
    generateTokens(_beneficiary, _tokens);
  }
}