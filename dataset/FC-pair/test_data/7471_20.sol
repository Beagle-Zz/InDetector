contract c7471{
  /**
   * @dev Returns the address of a store
   * @param _appNickname The app nickname
   */
  function getStoreAddress(
    string _appNickname
  )
  external
  constant returns (address) {
    return __stores[__appIds[_appNickname]].addr;
  }
}