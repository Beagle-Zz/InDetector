contract c10674{
  /**
   * @dev Chnage block reward according to GDP 
   * @param newBlockReward the new block reward in case of possible growth
   */
  function setPositiveGrowth(int256 newBlockReward) public onlyGDPOracle returns(bool) {
    // protect against error / overflow
    require(0 <= newBlockReward);
    emit BlockRewardChanged(blockReward_, newBlockReward);
    blockReward_ = newBlockReward;
  }
}