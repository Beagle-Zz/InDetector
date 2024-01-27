contract c12988{
  // Require that burning is turned off
  modifier cantBurn() {
    require(!burnAllowed);
    _;
  }
}