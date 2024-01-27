contract c7066{
  /**
   * Get flags for given address.
   *
   * @param _address address to get flags for
   * @return flags for given address
   */
  function flags (address _address) public delegatable view returns (uint256) {
    return addressFlags [_address];
  }
}