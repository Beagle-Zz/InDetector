contract c11246{
  /**
   * @notice return releaseable amount for beneficiary in case of variable type of release
   */
  function getVariableReleasableAmount(address _beneficiary) internal view returns (uint releasableAmount) {
    Beneficiary memory _b = beneficiaries[_beneficiary];
    Release memory _r = releases[_beneficiary];
    // total amount of tokens beneficiary will receive
    uint totalReleasableAmount = getTotalLockedAmounts(_beneficiary);
    uint releaseRatio;
    // reverse order for short curcit
    for(uint i = _r.releaseTimes.length - 1; i >= 0; i--) {
      if (now >= _r.releaseTimes[i]) {
        releaseRatio = _r.releaseRatios[i];
        break;
      }
    }
    require(releaseRatio > 0);
    releasableAmount = getPartialAmount(
      releaseRatio,
      coeff,
      totalReleasableAmount);
    releasableAmount = releasableAmount.sub(_b.withdrawAmount);
  }
}