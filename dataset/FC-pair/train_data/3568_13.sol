contract c3568{
  /// @dev Get the current balance of tokens in the vault
  /// @return uint How many tokens there are currently in vault
  function getBalance() public constant returns (uint howManyTokensCurrentlyInVault) {
    return token.balanceOf(address(this));
  }
}