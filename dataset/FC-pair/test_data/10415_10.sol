contract c10415{
  /**
   * @dev every user can withdraw his reward
   */
  function withdrawReward() public {
    require(betClosed);
    require(!withdrawRecord[msg.sender]);
    require(winChoice > 0);
    require(winReward > 0);
    require(addressOfChoice[winChoice][msg.sender]);
    msg.sender.transfer(winReward);
    withdrawRecord[msg.sender] = true;
    LogDistributeReward(msg.sender, winReward);
  }
}