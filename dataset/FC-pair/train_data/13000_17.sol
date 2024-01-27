contract c13000{
  // modifier to only accept transferAndCall from CLN token
  modifier CLNOnly() {
    require(msg.sender == clnAddress);
    _;
  }
}