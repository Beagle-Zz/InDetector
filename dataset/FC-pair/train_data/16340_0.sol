contract c16340{
  // Modifier for important owner only functions
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
}