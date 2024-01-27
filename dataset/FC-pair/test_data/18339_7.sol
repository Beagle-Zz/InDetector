contract c18339{
  /**
   * @dev Update account for Royalty
   * @param account The address of owner
   */
  function updateAccount(address account) internal {
    uint256 owing = RoyaltysOwing(account);
    accounts[account].lastRoyaltyPoint = totalRoyalty;
    if (owing > 0) {
      unclaimedRoyalty = unclaimedRoyalty.sub(owing);
      accounts[account].balance = accounts[account].balance.add(owing);
    }
  }
}