contract c8314{
  /**
   * @dev Release tokens from vault - unlock them and destroy contract
   */
  function releaseTokens() onlyOwner public {
    require(releaseDate > block.timestamp);
    uint256 amount;
    for (uint256 i = 0; i < team.length; i++) {
      require(tkn.transfer(team[i].memberAddress, team[i].tokens));
    }
    amount = tkn.balanceOf(address(this));
    require(tkn.transfer(owner, amount));
    selfdestruct(owner);
  }
}