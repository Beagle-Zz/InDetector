contract c10412{
  // lock transfer during the ICO
  modifier onlyUnlocked() {
    if (msg.sender != owner && locked) throw;
    _;
  }
}