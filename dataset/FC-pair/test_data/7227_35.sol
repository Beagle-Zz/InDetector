contract c7227{
  // overriding FinalizableCrowdsale#finalization to add 20% of sold token for owner
  function finalization() internal {
    // mint locked token to Crowdsale contract
    uint256 restrictedTokens = soldTokens.div(100).mul(restrictedPercent);
    token.mint(this, restrictedTokens);
    token.kycVerify(this);
    Y1_lockedTokenReleaseTime = now + 1 years;
    Y1_lockedTokenAmount = restrictedTokens.div(2);
    Y2_lockedTokenReleaseTime = now + 2 years;
    Y2_lockedTokenAmount = restrictedTokens.div(2);
    // stop minting new tokens
    token.finishMinting();
    // transfer the contract ownership to OAKTokenCrowdsale.owner
    token.transferOwnership(owner);
  }
}