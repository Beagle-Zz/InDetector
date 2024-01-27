contract c16883{
  /**
   * @dev Sets the address of the PentacoreRedemption contract.
   * @param _address PentacoreRedemption contract address.
   */
  function setRedemptionContract(address _address) external onlyBy(owner) {
    redemption = _address;
  }
}