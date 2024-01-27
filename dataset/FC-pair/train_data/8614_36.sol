contract c8614{
  /**
   * @dev returns THIS contract instance's version
   * @return COINSPARROW_CONTRACT_VERSION version number of THIS instance of the contract
   */
  function getContractVersion() external pure returns(uint8) {
    return COINSPARROW_CONTRACT_VERSION;
  }
}