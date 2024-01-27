contract c4165{
  /**
   * @dev Internal function to update the credit balance of a user when staking tokens.
   *  Users are rewarded with more tokens the longer they stake for.
   * @param _user address The address to award credits to
   * @param _amount uint256 The number of tokens being staked
   * @param _lockInDuration uint256 The duration (in seconds) that the stake should be locked for
   */
  function updateCreditBalance(
    address _user,
    uint256 _amount,
    uint256 _lockInDuration
  )
    internal
  {
    uint256 divisor = 1 ether;
    require(
      _amount >= divisor,
      "Insufficient amount");
    // NOTE: Truncation is intentional here
    // If a user stakes for less than the minimum duration, they are awarded with 0 credits
    // If they stake 2x the minimum duration, they are awarded with 2x credits
    // etc.
    uint256 rewardMultiplier = _lockInDuration / defaultLockInDuration;
    uint256 creditsAwarded = _amount.mul(rewardMultiplier).div(divisor);
    creditBalances[_user] = creditBalances[_user].add(creditsAwarded);
  }
}