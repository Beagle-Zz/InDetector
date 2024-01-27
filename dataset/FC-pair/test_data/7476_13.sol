contract c7476{
  /**
   * @dev Returns the appId
   */
  function getAppId()
  external
  whenAppSet
  constant returns (uint) {
    return appId;
  }
}