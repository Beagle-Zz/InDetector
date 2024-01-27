contract c4135{
  // Modifier for accessibility to define new hero types.
  modifier onlyAccessMint {
    require(msg.sender == owner || mintAccess[msg.sender] == true);
    _;
  }
}