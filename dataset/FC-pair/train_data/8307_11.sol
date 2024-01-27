contract c8307{
  /**
   * @dev Set the crowdsale contract address
   * @param _crowdSale Crowdsale contract address
   */
  function setCrowdSaleAddress(address _crowdSale) onlyOwner public { // set the crowdsale contract address
    cSale = CrowdSale(_crowdSale);
  }
}