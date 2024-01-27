contract c7471{
  /**
   * @dev Return a numeric code about the upgradability of a couple wallet-uid in a certain app
   * @param _appId The id of the app
   * @param _address The address of the wallet
   * @param _uid The user-id
   */
  function getUpgradability(
    uint _appId,
    address _address,
    string _uid
  )
  external
  constant returns (uint)
  {
    StoreInterface _store = __getStore(_appId);
    if (!_store.isUpgradable(_address, _uid)) {
      return notUpgradableInStore;
    } else if (!isAddressUpgradable(_store, _address)) {
      return addressNotUpgradable;
    } else {
      return upgradable;
    }
  }
}