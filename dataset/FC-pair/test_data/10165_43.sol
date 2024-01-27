contract c10165{
  /**
  * @notice Overrided getTokenAmount function of parent Crowdsale contract
    to calculate the token with time and amount bonus.
  * @param weiAmount walelt of investor to receive tokens
  */
  function getTokenAmount(uint256 weiAmount) internal view returns(uint256) {
    // Compute time and amount bonus
    uint256 bonus = computeBonus(weiAmount);
    uint256 rateWithBonus = rate.mul(coeff.add(bonus)).div(coeff);
    return weiAmount.mul(rateWithBonus);
  }
}