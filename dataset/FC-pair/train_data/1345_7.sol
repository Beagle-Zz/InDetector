contract c1345{
  // Requires msg.sender to be owner
  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }
}