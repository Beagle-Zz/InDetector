contract c7471{
  /**
   * @dev Allows other contracts to check if a store is active
   * @param _appId The id of a configured app
   */
  function isStoreActive(
    uint _appId
  )
  public
  constant returns (bool){
    return __stores[_appId].active;
  }
}