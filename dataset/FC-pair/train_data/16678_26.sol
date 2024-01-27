contract c16678{
  /// @dev Claim N bought tokens to the investor as the msg sender
  function claim() {
    address investor = msg.sender;
    if(lockedAt == 0) {
      throw; // We were never locked
    }
    if(now < freezeEndsAt) {
      throw; // Trying to claim early
    }
    if(balances[investor] == 0) {
      // Not our investor
      throw;
    }
    if(claimed[investor] > 0) {
      throw; // Already claimed
    }
    uint amount = balances[investor];
    claimed[investor] = amount;
    totalClaimed += amount;
    token.transfer(investor, amount);
    Distributed(investor, amount);
  }
}