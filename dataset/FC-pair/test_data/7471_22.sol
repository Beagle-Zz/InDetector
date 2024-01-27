contract c7471{
  /**
   * @dev Returns the address of any customerService account
   */
  function getCustomerServiceAddress()
  external
  constant returns (address[]) {
    return __customerServiceAddress;
  }
}