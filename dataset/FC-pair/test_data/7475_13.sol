contract c7475{
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