contract c7221{
  /**
   * @dev Handles the off-chain whitelisting.
   * @param _addr Address of the sender.
   * @param _sig signed message provided by the sender.
   */
  function handleOffchainWhitelisted(address _addr, bytes _sig) external onlyOwnerOrCrowdsale returns (bool) {
    bool valid;
    // no need for consuming gas when the address is already whitelisted 
    if (whitelist[_addr]) {
      valid = true;
    } else {
      valid = isValidSignature(_addr, _sig);
      if (valid) {
        // no need for consuming gas again if the address calls the contract again. 
        addAddressToWhitelist(_addr);
      }
    }
    return valid;
  }
}