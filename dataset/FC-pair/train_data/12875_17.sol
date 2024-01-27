contract c12875{
  /**
   * @dev True if the specified address is whitelisted.
   */
  function isAddressInWhitelist(address _address) view public returns (bool) {
    return whitelistedAddresses[_address];
  }
}