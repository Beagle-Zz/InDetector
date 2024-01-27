contract c13371{
  /**
  * @dev Gets the outstanding reward of a specified address.
  * @param _owner The address to query the reward of.
  * @return A uint256 representing the outstanding reward of the passed address.
  */
  function calculateReward(address _owner) public view returns (uint256) {
    // address must be running a node
    if (isMining(_owner)) {
      // return outstanding reward
      uint256 reward = rewardPerNode().mul(nodes[_owner]);
      return reward.sub(claimed[_owner]);
    }
  }
}