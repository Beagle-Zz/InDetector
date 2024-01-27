contract c8631{
  /**
   * @dev called by the owner to burn all unsold tokens
   */
  function burnTokens() public onlyOwner {
    require(now > closingTime);
    uint256 unsold = token.balanceOf(this);
    token.transfer(address(0), unsold);
  }
}