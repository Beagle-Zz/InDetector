contract c1023{
  // Require msg.sender to be zlots
  modifier onlyZlots() {
    require(msg.sender == zlots);
    _;
  }
}