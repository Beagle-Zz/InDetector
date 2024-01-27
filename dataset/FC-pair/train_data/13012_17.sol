contract c13012{
  // modifier to only accept transferAndCall from CLN token
  modifier CLNOnly() {
    require(msg.sender == clnAddress);
    _;
  }
}