contract c18339{
  /**
   * Adjust reward amount
   */
  function adjustReward (uint256 reward) onlyOwner public {
    rewardAmount = reward; // may be zero, no need to check value to 0
  }
}