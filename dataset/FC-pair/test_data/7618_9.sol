contract c7618{
  /**
   * @dev called by the owner to withdraw unsold tokens
   */
  function withdrawTokens() public onlyOwner {
    uint256 unsold = token.balanceOf(this);
    token.transfer(owner, unsold);
  }
}