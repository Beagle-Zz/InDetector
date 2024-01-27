contract c16867{
  /**
   * @dev Sets the address of the PentacoreCrowdsale contract.
   * @param _address PentacoreCrowdsale contract address.
   */
  function setCrowdsaleContract(address _address) external onlyBy(owner) {
    crowdsale = _address;
  }
}