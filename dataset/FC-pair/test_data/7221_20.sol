contract c7221{
  /**
   * @dev Function to check if an address is whitelisted
   * @param _address address The address to be checked.
   */
  function whitelist(address _address) view external returns (bool) {
    return whitelist[_address];
  }
}