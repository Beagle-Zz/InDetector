contract c10129{
  /**
   * Allow owner to adjust the cap during the presale.
   *
   * This allows e.g. US dollar pegged caps.
   */
  function setWeiCap(uint newCap) public onlyOwner {
    saleWeiCap = newCap;
    CapUpdated(newCap);
  }
}