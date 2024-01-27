contract c40167{
   
  function setupTimeWindow(uint256 secs) onlyOwnerUnlocked setter {
    timeWindow = secs;
  }
}