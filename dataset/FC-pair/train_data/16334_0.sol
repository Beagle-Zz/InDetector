contract c16334{
  // Modifier for important owner only functions
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
}