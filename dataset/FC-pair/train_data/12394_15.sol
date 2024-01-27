contract c12394{
  /**
   * @dev Check if an address is whitelisted by SEND
   * @param _address Address to check
   * @return bool
   */
  function isVerified(address _address) public view returns(bool) {
    return verifiedAddresses[_address];
  }
}