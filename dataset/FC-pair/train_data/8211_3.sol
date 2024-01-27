contract c8211{
  /**
   * @dev Gets the store managing the specified app
   * @param _appNickname The nickname of the app
   */
  function getStore(
    string _appNickname
  )
  public
  constant returns(address)
  {
    return stores[keccak256(_appNickname)];
  }
}