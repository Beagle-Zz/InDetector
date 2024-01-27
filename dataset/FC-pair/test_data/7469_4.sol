contract c7469{
  /**
   * @dev Returns true if the registry looks ready
   */
  function isReady()
  external
  constant returns (uint)
  {
    if (manager == address(0)) {
      return managerUnset;
    }
    if (claimer == address(0)) {
      return claimerUnset;
    }
    ManagerInterface theManager = ManagerInterface(manager);
    ClaimerInterface theClaimer = ClaimerInterface(claimer);
    if (theManager.claimer() != claimer) {
      return wrongClaimerOrUnsetInManager;
    }
    if (theClaimer.manager() != manager) {
      return wrongManagerOrUnsetInClaimer;
    }
    uint totalStores = theManager.totalStores();
    if (totalStores == 0) {
      return noStoresSet;
    }
    bool atLeastOneIsActive;
    for (uint i = 1; i <= totalStores; i++) {
      StoreInterface theStore = StoreInterface(theManager.getStoreAddressById(i));
      if (theManager.isStoreActive(i)) {
        atLeastOneIsActive = true;
      }
      if (theManager.isStoreActive(i)) {
        if (theStore.manager() != manager) {
          return managerNotSetInApp + i;
        }
      }
    }
    if (atLeastOneIsActive == false) {
      return noStoreIsActive;
    }
    if (theManager.paused() == true) {
      return managerIsPaused;
    }
    return allSet;
  }
}