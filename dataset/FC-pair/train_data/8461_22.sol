contract c8461{
  /**
   * @dev add an address to the whitelist
   * @param addr address
   * @return true if the address was added to the whitelist, false if the address was already in the whitelist
   */
  function addAddressToWhitelist(address addr) onlyWhitelisted whenNotPaused public returns(bool success) {
    if (!whitelist[addr]) {
      whitelist[addr] = true;
      numberOfWhitelists++;
      emit WhitelistedAddressAdded(addr);
      success = true;
    }
  }
}