contract c12992{
  // New modifier to be used in place of OWNER ONLY activity
  // Eventually this will be owned by a controller contract and not a private wallet
  // (Voting needs to be implemented)
  modifier justOwner() {
    require(msg.sender == owner);
    _;
  }
}