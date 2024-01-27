contract c10674{
  /**
   * @dev Chnage block reward according to GDP 
   * @param newBlockReward the new block reward in case of negative growth
   */
  function setNegativeGrowth(int256 newBlockReward) public onlyGDPOracle returns(bool) {
    require(newBlockReward < 0);
    emit BlockRewardChanged(blockReward_, newBlockReward);
    blockReward_ = newBlockReward;
  }
}