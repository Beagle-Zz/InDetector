contract c18677{
  /**
   * Total allowable purchase of tokens per address
   */
  function setMaximumPurchaseFraction(uint _maximum) public onlyOwner {
    maximumPurchaseFraction = _maximum;
  }
}