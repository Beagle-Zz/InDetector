contract c10674{
  /**
  * @dev Calculate the reward if withdraw() happans on this block
  * @notice The reward is calculated by the formula:
  * (numberOfBlocks) * (effectiveBlockReward) * (commitment.value) / (effectiveStake) 
  * effectiveBlockReward is the average between the block reward during commit and the block reward during the call
  * effectiveStake is the average between the stake during the commit and the stake during call (liniar aproximation)
  * @return An uint256 representing the reward amount
  */ 
  function getReward(address _miner) public view returns (uint256) {
    if (miners[_miner].value == 0) {
      return 0;
    }
    Commitment storage commitment = miners[_miner];
    int256 averageBlockReward = signedAverage(commitment.onBlockReward, blockReward_);
    require(0 <= averageBlockReward);
    uint256 effectiveBlockReward = uint256(averageBlockReward);
    uint256 effectiveStake = average(commitment.atStake, totalStake_);
    uint256 numberOfBlocks = block.number.sub(commitment.onBlockNumber);
    uint256 miningReward = numberOfBlocks.mul(effectiveBlockReward).mul(commitment.value).div(effectiveStake);
    return miningReward;
  }
}