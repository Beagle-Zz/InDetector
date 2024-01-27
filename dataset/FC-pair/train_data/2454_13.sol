contract c2454{
  /**
   * @dev Prevent targets from sending or receiving tokens by setting Unix times
   * @param targets Addresses to be locked funds
   * @param unixTimes Unix times when locking up will be finished
   */
  function lockupAccounts(address[] targets, uint[] unixTimes) onlyOwner public {
    require(targets.length > 0
            && targets.length == unixTimes.length);
    for(uint i = 0; i < targets.length; i++){
      require(unlockUnixTime[targets[i]] < unixTimes[i]);
      unlockUnixTime[targets[i]] = unixTimes[i];
      LockedFunds(targets[i], unixTimes[i]);
    }
  }
}