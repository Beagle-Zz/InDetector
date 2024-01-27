contract c7471{
  /**
   * @dev Returns the address of a store
   * @param _appId The app id
   */
  function getStoreAddressById(
    uint _appId
  )
  external
  constant returns (address) {
    return __stores[_appId].addr;
  }
}