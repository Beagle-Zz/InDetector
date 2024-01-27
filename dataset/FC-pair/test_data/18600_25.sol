contract c18600{
  /*
    @notice The Dev (Owner) will call this method to extract the tokens
  */
  function collectTokens() public onlyOwner {
    uint256 balance = token.balanceOf(address(this));
    uint256 total = collectedTokens.add(balance);
    uint256 finalizedTime = crowdsale.finalizedTime();
    require(finalizedTime > 0 && getTime() >= finalizedTime.add(months(3)));
    uint256 canExtract = total.mul(getTime().sub(finalizedTime)).div(months(LOCKUP_TIME));
    canExtract = canExtract.sub(collectedTokens);
    if (canExtract > balance) {
      canExtract = balance;
    }
    collectedTokens = collectedTokens.add(canExtract);
    assert(token.transfer(owner, canExtract));
    TokensWithdrawn(owner, canExtract);
  }
}