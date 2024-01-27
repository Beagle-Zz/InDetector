contract c7471{
  // internal getters
  function __getStore(
    uint _appId
  )
  internal
  constant returns (StoreInterface)
  {
    return __stores[_appId].store;
  }
}