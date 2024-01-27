contract c16428{
  /**
   * @dev Must be called after crowdsale ends, to do some extra finalization
   * work. Calls the contract's finalization function.
   */
  function finalize() onlyOwner public {
    require(!isFinalized);
   // require(hasEnded());
    finalization();
    emit SwordFinalized();
    isFinalized = true;
  }
}