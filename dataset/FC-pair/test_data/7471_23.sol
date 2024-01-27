contract c7471{
  // primary methods
  /**
   * @dev Sets a new identity
   * @param _appId The id of the app
   * @param _address The address of the wallet
   * @param _uid The user-id
   */
  function setIdentity(
    uint _appId,
    address _address,
    string _uid
  )
  external
  onlyClaimer
  whenStoreSet(_appId)
  whenNotPaused
  {
    require(_address != address(0));
    StoreInterface _store = __getStore(_appId);
    require(_store.isUid(_uid));
    if (isUpgradable(_store, _address, _uid)) {
      _store.setIdentity(_address, _uid);
    } else {
      IdentityNotUpgradable(appNicknames[_appId], _address, _uid);
    }
  }
}