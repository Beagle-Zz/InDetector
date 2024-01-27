contract c7475{
  // primary methods
  /**
   * @dev Sets a tweedentity
   * @param _address The address of the wallet
   * @param _uid The user-id of the owner user account
   */
  function setIdentity(
    address _address,
    string _uid
  )
  external
  onlyManager
  whenAppSet
  {
    require(_address != address(0));
    require(isUid(_uid));
    require(isUpgradable(_address, _uid));
    if (bytes(__uidByAddress[_address].lastUid).length > 0) {
      // if _address is associated with an oldUid,
      // this removes the association between _address and oldUid
      __addressByUid[__uidByAddress[_address].lastUid] = Address(address(0), __addressByUid[__uidByAddress[_address].lastUid].lastUpdate);
      identities--;
    }
    __uidByAddress[_address] = Uid(_uid, now);
    __addressByUid[_uid] = Address(_address, now);
    identities++;
    IdentitySet(_address, _uid);
  }
}