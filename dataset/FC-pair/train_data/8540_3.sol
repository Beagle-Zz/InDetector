contract c8540{
  /// @dev Modifier to allow actions only when the contract IS NOT paused
  modifier whenNotPaused() {
    require(!paused);
    _;
  }
}