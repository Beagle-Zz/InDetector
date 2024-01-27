contract c10547{
  // Loop over vesting rules, bail if date not yet passed.
  // If date passed, unlock aces and disable rule
  function _processVestingRules(address _address) internal {
    for (uint256 i = uint256(0); i < vestingRules[_address].length; i++) {
      if (vestingRules[_address][i].processed == false && vestingRules[_address][i].unlockTime < _now()) {
        lockedAces[_address] = lockedAces[_address].sub(vestingRules[_address][i].aces);
        vestingRules[_address][i].processed = true;
      }
    }
  }
}