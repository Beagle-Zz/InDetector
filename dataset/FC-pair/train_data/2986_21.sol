contract c2986{
    /// @dev Check how many tokens "investor" can claim
    /// @param investor Address of the investor
    /// @return uint How many tokens the investor can claim now
    function getCurrentlyClaimableAmount(address investor) public constant returns (uint claimableAmount) {
      uint maxTokensLeft = balances[investor] - claimed[investor];
      if (now < freezeEndsAt) {
        return 0;
      }
      if (tokensPerSecond > 0) {
        uint previousClaimAt = lastClaimedAt[investor];
        uint maxClaim;
        if (previousClaimAt == 0) {
          previousClaimAt = freezeEndsAt;
        }
        maxClaim = (now - previousClaimAt) * tokensPerSecond;
        if (maxClaim > maxTokensLeft) {
          return maxTokensLeft;
        } else {
          return maxClaim;
        }
      } else {
        return maxTokensLeft;
      }
    }
}