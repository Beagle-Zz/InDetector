contract c7471{
  /**
   * @dev Unable/disable a store
   * @param _appNickname The store to be enabled/disabled
   * @param _active A bool to unable (true) or disable (false)
   */
  function activateStore(
    string _appNickname,
    bool _active
  )
  public
  onlyOwner
  {
    uint _appId = __appIds[_appNickname];
    require(__stores[_appId].active != _active);
    __stores[_appId] = Store(
      __stores[_appId].store,
      __stores[_appId].addr,
      _active
    );
    StoreActive(_appNickname, __stores[_appId].addr, _active);
  }
}