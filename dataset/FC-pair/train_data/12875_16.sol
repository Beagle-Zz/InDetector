contract c12875{
  /**
   * @dev Remove addresses from the whitelist.
   * @param _addresses addresses
   * @return true if at least one address was removed from the whitelist, 
   * false if all addresses weren't in the whitelist in the first place
   */
  function removeAddressesFromWhitelist(address[] _addresses) onlyOwner public returns (bool success) {
    success = false;
    for (uint256 i = 0; i < _addresses.length; i++) {
      if (removeAddressFromWhitelist(_addresses[i])) {
        success = true;
      }
    }
  }
}