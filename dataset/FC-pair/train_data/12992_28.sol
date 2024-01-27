contract c12992{
  // Require that burning is turned off
  modifier cantBurn() {
    require(!burnAllowed);
    _;
  }
}