contract c12384{
  // Modifier to control who executes functions
  modifier onlyOwnerOrAdmin() {
    require(msg.sender == owner || admins[msg.sender]);
    _;
  }
}