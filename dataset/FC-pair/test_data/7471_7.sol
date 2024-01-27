contract c7471{
  // config
  /**
   * @dev Sets a store to be used by the manager
   * @param _appNickname The nickname of the app for which the store's been configured
   * @param _address The address of the store
   */
  function setAStore(
    string _appNickname,
    address _address
  )
  public
  onlyOwner
  {
    require(bytes(_appNickname).length > 0);
    bytes32 _appNickname32 = keccak256(_appNickname);
    require(_address != address(0));
    StoreInterface _store = StoreInterface(_address);
    require(_store.getAppNickname() == _appNickname32);
    uint _appId = _store.getAppId();
    require(appNicknames32[_appId] == 0x0);
    appNicknames32[_appId] = _appNickname32;
    appNicknames[_appId] = _appNickname;
    __appIds[_appNickname] = _appId;
    __stores[_appId] = Store(
      _store,
      _address,
      true
    );
    totalStores++;
    StoreSet(_appNickname, _address);
    StoreActive(_appNickname, _address, true);
  }
}