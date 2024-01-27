contract c13371{
  /**
  * @dev Gets the total reward for a node.
  * @return A uint256 representing the total reward of a node.
  */
  function rewardPerNode() public view returns (uint256) {
    // no reward if there are no active nodes
    if (totalNodes == 0) {
      return;
    }
    // days since last checkpoint
    uint256 totalDays = block.timestamp.sub(rewardTimestamp).mul(PRECISION).div(1 days);
    // reward * days / nodes
    uint256 newReward = BASE_REWARD.mul(totalDays).div(PRECISION).div(totalNodes);
    // checkpoint + newReward
    return rewardCheckpoint.add(newReward);
  }
}