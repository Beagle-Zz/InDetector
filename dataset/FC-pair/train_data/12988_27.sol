contract c12988{
  // Require Burn to be turned on
  modifier canBurn() {
    require(burnAllowed);
    _;
  }
}