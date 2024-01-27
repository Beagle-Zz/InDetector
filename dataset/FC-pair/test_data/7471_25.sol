contract c7471{
  /**
   * @dev Allow the sender to unset its existent identity
   * @param _appId The id of the app
   */
  function unsetMyIdentity(
    uint _appId
  )
  external
  whenStoreSet(_appId)
  whenNotPaused
  {
    StoreInterface _store = __getStore(_appId);
    _store.unsetIdentity(msg.sender);
  }
}