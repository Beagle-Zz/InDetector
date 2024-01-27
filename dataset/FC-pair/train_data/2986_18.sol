contract c2986{
    /// @dev Lock the vault
    ///      - All balances have been loaded in correctly
    ///      - Tokens are transferred on this vault correctly
    ///      - Checks are in place to prevent creating a vault that is locked with incorrect token balances.
    function lock() onlyOwner {
      if(lockedAt > 0) {
        throw; // Already locked
      }
      // Spreadsheet sum does not match to what we have loaded to the investor data
      if(tokensAllocatedTotal != tokensToBeAllocated) {
        throw;
      }
      // Do not lock the vault if the given tokens are not on this contract
      if(token.balanceOf(address(this)) != tokensAllocatedTotal) {
        throw;
      }
      lockedAt = now;
      Locked();
    }
}