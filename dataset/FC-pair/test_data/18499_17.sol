contract c18499{
  // send ether to the fund collection wallet
  // override to create custom fund forwarding mechanisms
  function forwardFunds(uint256 value) internal {
    wallet.transfer(value);
  }
}