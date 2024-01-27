contract c7471{
  /**
   * @dev Unsets an existent identity
   * @param _appId The id of the app
   * @param _address The address of the wallet
   */
  function unsetIdentity(
    uint _appId,
    address _address
  )
  external
  onlyCustomerService
  whenStoreSet(_appId)
  whenNotPaused
  {
    StoreInterface _store = __getStore(_appId);
    _store.unsetIdentity(_address);
  }
}