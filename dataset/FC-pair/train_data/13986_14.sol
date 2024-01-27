contract c13986{
  /**
   * @dev Adds an array of addresses to the whitelist, all with the same optional custom rate.
   * @param _addresses Addresses to add.
   * @param _rate Optional custom rate reserved for all added addresses (0 = use default rate).
   * @return true if at least one address was added to the whitelist,
   * false if all addresses were already in the whitelist  
   */
  function addAddressesToWhitelist(address[] _addresses, uint256 _rate) onlyOwner public returns (bool success) {
    success = false;
    for (uint256 i = 0; i <_addresses.length; i++) {
      if (addAddressToWhitelist(_addresses[i], _rate)) {
        success = true;
      }
    }
  }
}