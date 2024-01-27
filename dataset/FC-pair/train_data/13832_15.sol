contract c13832{
  /**
   * Transfer from sender to another account
   *
   * @param to Destination address
   * @param value Amount of BitdealCoins to send
   */
  function transfer(address to, uint256 value) public validDestination(to) returns (bool) {
    return super.transfer(to, value);
  }
}