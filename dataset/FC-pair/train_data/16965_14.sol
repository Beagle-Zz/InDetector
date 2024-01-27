contract c16965{
  /**
   * @dev Reclaim all ERC20Basic compatible tokens
   * @param missing_token ERC20Basic The address of the token contract (missing_token)
   */
  function recoverERC20Token_SendbyMistake(ERC20Basic missing_token) external onlyOwner {
    uint256 balance = missing_token.balanceOf(this);
    missing_token.safeTransfer(owner, balance);
  }
}