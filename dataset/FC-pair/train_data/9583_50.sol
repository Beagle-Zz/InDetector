contract c9583{
  // Modifier for accessibility to define new hero types.
  modifier onlyCard {
    require(msg.sender == cardAddess);
    _;
  }
}