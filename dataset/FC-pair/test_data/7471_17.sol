contract c7471{
  /**
   * @dev Allows other contracts to check if a store is set
   * @param _appNickname The nickname of a configured app
   */
  function isStoreSet(
    string _appNickname
  )
  public
  constant returns (bool){
    return __appIds[_appNickname] != 0;
  }
}