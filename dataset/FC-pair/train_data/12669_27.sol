contract c12669{
  // Require Burn to be turned on
  modifier canBurn() {
    require(burnAllowed);
    _;
  }
}