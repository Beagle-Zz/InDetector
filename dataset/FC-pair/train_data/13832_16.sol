contract c13832{
  /**
   * Transfer from `from` account to `to` account using allowance in `from` account to the sender
   *
   * @param from Origin address
   * @param to Destination address
   * @param value Amount of BitdealCoins to send
   */
  function transferFrom(address from, address to, uint256 value) public validDestination(to) returns (bool) {
    return super.transferFrom(from, to, value);
  }
}