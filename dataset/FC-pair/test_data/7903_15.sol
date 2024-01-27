contract c7903{
  /**
  * @dev Release a part of the frozen token(totalSupply - releasedSupply) every 26 weeks.
  * @return An uint256 representing the amount.
  */
  function release() public whenNotPaused returns(uint256 _releaseAmount) {
    require(nextReleaseTime <= now);
    uint256 releaseAmount = 0;
    uint256 remainderAmount = totalSupply.sub(releasedSupply);
    if (remainderAmount > 0) {
      releaseAmount = standardDecimals.mul(nextReleaseAmount);
      if (releaseAmount > remainderAmount)
        releaseAmount = remainderAmount;
      releasedSupply = releasedSupply.add(releaseAmount);
      balances[owner] = balances[owner].add(releaseAmount);
      emit Release(msg.sender, releaseAmount, nextReleaseTime);
      nextReleaseTime = nextReleaseTime.add(26 * 1 weeks);
      nextReleaseAmount = nextReleaseAmount.sub(nextReleaseAmount.div(4));
    }
    return releaseAmount;
  }
}