contract c11245{
  /**
   * @notice calculate fund wrt sale cap. Override this function to control ether cap.
   * @param _beneficiary address address to receive tokens
   * @param _weiAmount uint256 amount of ether in wei
   */
  function calculateToFund(address _beneficiary, uint256 _weiAmount) internal view returns (uint256) {
    uint256 toFund;
    uint256 postWeiRaised = weiRaised.add(_weiAmount);
    if (postWeiRaised > cap) {
      toFund = cap.sub(weiRaised);
    } else {
      toFund = _weiAmount;
    }
    return toFund;
  }
}