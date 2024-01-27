contract c18339{
  /**
   * Get Royalty amount for given account
   *
   * @param account The address for Royalty account
   */
  function RoyaltysOwing(address account) public view returns (uint256) {
    uint256 newRoyalty = totalRoyalty.sub(accounts[account].lastRoyaltyPoint);
    return balances[account].mul(newRoyalty).div(totalSupply);
  }
}