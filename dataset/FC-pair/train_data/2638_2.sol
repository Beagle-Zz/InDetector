contract c2638{
  // Requires msg.sender to be owner
  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }
}