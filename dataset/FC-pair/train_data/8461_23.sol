contract c8461{
  /**
   * @dev remove an address from the whitelist
   * @param addr address
   * @return true if the address was removed from the whitelist,
   * false if the address wasn't in the whitelist in the first place
   */
  function removeAddressFromWhitelist(address addr) onlyWhitelisted whenNotPaused public returns(bool success) {
    require(numberOfWhitelists > 1);
    if (whitelist[addr]) {
      whitelist[addr] = false;
      numberOfWhitelists--;
      emit WhitelistedAddressRemoved(addr);
      success = true;
    }
  }
}