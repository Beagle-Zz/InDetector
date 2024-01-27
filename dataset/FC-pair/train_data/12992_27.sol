contract c12992{
  // Require Burn to be turned on
  modifier canBurn() {
    require(burnAllowed);
    _;
  }
}