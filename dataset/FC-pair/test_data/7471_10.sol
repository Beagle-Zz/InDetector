contract c7471{
  /**
  * @dev Sets new manager
  */
  function switchClaimerAndRemoveOldOne()
  external
  onlyOwner
  {
    require(newClaimer != address(0));
    ClaimerSwitch(claimer, newClaimer);
    claimer = newClaimer;
    newClaimer = address(0);
  }
}