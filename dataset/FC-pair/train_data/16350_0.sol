contract c16350{
  // Modifier for important owner only functions
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
}