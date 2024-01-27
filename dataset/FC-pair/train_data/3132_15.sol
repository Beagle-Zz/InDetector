contract c3132{
  // This callable function returns the token balance that a contributor can currently claim.
  function checkAvailableTokens (address addr, address tokenAddr) view public returns (uint tokenAmount) {
    var c = whitelist[addr];
    var d = distributionMap[tokenAddr];
    for (uint i = c.tokensClaimed[tokenAddr]; i < d.pct.length; i++) {
      tokenAmount = tokenAmount.add(_applyPct(c.balance, d.pct[i]));
    }
    return tokenAmount;
  }
}