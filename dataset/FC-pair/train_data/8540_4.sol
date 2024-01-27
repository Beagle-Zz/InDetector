contract c8540{
  /// @dev Modifier to allow actions only when the contract IS paused
  modifier whenPaused() {
    require(paused);
    _;
  }
}