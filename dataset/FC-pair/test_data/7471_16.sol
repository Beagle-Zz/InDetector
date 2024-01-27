contract c7471{
  // getters
  /**
   * @dev Gets the app-id associated to a nickname
   * @param _appNickname The nickname of a configured app
   */
  function getAppId(
    string _appNickname
  )
  external
  constant returns (uint) {
    return __appIds[_appNickname];
  }
}