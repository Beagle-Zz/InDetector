contract c18691{
  /**
   * Tranche TX minimums
   */
  function setTrancheMinTx(uint _minimum) public onlyOwner {
    trancheMinTx = _minimum;
  }
}