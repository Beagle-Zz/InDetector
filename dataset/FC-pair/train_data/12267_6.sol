contract c12267{
  /**
   * Must be called after crowdsale ends, to do some extra finalization work.
   */
  function finalize() onlyOwner public {
    require(!isFinalized);
    transferBallance();
    emit Finalized();
    isFinalized = true;
  }
}