contract c8152{
  // Modifier to only allow the execution of
  // certain functions when betting is closed
  modifier bettingIsClosed() {
    require (now >= BETTING_CLOSES);
    _;
  }
}