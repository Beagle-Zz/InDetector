contract c16883{
  /**
   * @dev Sets the address of the PentacoreCrowdsale contract.
   * @param _address PentacoreCrowdsale contract address.
   */
  function setKYCAdmin(address _address) external onlyBy(owner) {
    kycAdmin = _address;
  }
}