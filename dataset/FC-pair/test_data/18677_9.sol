contract c18677{
  /**
   * Tranche TX minimums
   */
  function setTrancheMinTx(uint _minimum) public onlyOwner {
    trancheMinTx = _minimum;
  }
}