contract c7476{
  /**
   * @dev Returns the timestamp of last update by address
   * @param _address The address of the wallet
   */
  function getAddressLastUpdate(
    address _address
  )
  external
  constant returns (uint)
  {
    return __uidByAddress[_address].lastUpdate;
  }
}