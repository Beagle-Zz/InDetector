contract c16678{
  /// @dev Add a presale participating allocation
  function setInvestor(address investor, uint amount) public onlyOwner {
    if(lockedAt > 0) {
      // Cannot add new investors after the vault is locked
      throw;
    }
    if(amount == 0) throw; // No empty buys
    // Don't allow reset
    if(balances[investor] > 0) {
      throw;
    }
    balances[investor] = amount;
    investorCount++;
    tokensAllocatedTotal += amount;
    Allocated(investor, amount);
  }
}