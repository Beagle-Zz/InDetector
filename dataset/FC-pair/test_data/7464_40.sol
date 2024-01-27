contract c7464{
  /**
   * @dev Computes the bonus. The bonus is
   * - 0 by default
   * - 30% before reaching the softCap for those whitelisted.
   * - 15% the first week
   * - 10% the second week
   * - 8% the third week
   * - 6% the remaining time.
   * @param _time when the purchased happened.
   * @param _beneficiary Address performing the token purchase.
   * @param _value Value in wei involved in the purchase.
   */
  function getBonus(uint256 _time, address _beneficiary, uint256 _value) view internal returns (uint256 _bonus) {
    //default bonus is 0.
    _bonus = 0;
    // at this level the amount was added to weiRaised
    if ( (weiRaised.sub(_value) < goal) && earlyInvestors.whitelist(_beneficiary) ) {
      _bonus = 30;
    } else {
      if (_time < openingTime.add(7 days)) {
        _bonus = 15;
      } else if (_time < openingTime.add(14 days)) {
        _bonus = 10;
      } else if (_time < openingTime.add(21 days)) {
        _bonus = 8;
      } else {
        _bonus = 6;
      }
    }
    return _bonus;
  }
}