contract c8643{
  /**
   * Get address of this smart contract.
   *
   * @return address of this smart contract
   */
  function thisAddress () internal view returns (address) {
    return this;
  }
}