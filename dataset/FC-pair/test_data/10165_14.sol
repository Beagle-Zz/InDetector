contract c10165{
  /**
   * @notice return releaseable amount for beneficiary in case of straight type of release
   */
  function getStraightReleasableAmount(address _beneficiary) internal view returns (uint releasableAmount) {
    Beneficiary memory _b = beneficiaries[_beneficiary];
    Release memory _r = releases[_beneficiary];
    // total amount of tokens beneficiary can release
    uint totalReleasableAmount = getTotalLockedAmounts(_beneficiary);
    uint firstTime = _r.releaseTimes[0];
    uint lastTime = _r.releaseTimes[1];
    // solium-disable security/no-block-members
    require(now >= firstTime); // pass if can release
    // solium-enable security/no-block-members
    if(now >= lastTime) { // inclusive to reduce calculation
      releasableAmount = totalReleasableAmount;
    } else {
      // releasable amount at first time
      uint firstAmount = getPartialAmount(
        _r.releaseRatios[0],
        coeff,
        totalReleasableAmount);
      // partial amount without first amount
      releasableAmount = getPartialAmount(
        now.sub(firstTime),
        lastTime.sub(firstTime),
        totalReleasableAmount.sub(firstAmount));
      releasableAmount = releasableAmount.add(firstAmount);
    }
    // subtract already withdrawn amounts
    releasableAmount = releasableAmount.sub(_b.withdrawAmount);
  }
}