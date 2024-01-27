contract c10165{
  /**
  * @dev Computes overall bonus based on time of contribution and amount of contribution.
  * The total bonus is the sum of bonus by time and bonus by amount
  * @return bonus percentage scaled by 10
  */
  function computeBonus(uint256 weiAmount) public view returns(uint256) {
    return computeAmountBonus(weiAmount).add(computeTimeBonus());
  }
}