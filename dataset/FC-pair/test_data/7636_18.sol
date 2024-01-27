contract c7636{
  // Allow transfer of tokens back to owner or reserve wallet
  function returnTokens() public onlyOwner {
    uint256 balance = token.balanceOf(this);
    require(token.transfer(owner, balance));
  }
}