contract c16648{
  // Return end time for the jackpot round
  function getJackpotRoundEndTime() public view returns (uint256) {
    return lastAction + timeBeforeJackpot;
  }
}