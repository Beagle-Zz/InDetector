contract c7466{
  /**
   * @dev Function to set the crowdsale address
   * @param _crowdsale address The address of the crowdsale.
   */
  function setCrowdsale(address _crowdsale) external onlyOwner {
    require(_crowdsale != address(0));
    crowdsale = _crowdsale;
  }
}