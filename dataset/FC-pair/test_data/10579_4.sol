contract c10579{
  /// @dev Called by manager to pause the contract. Used only when
  ///  a bug or exploit is detected and we need to limit damage.
  function pause() external onlyManager whenNotPaused {
    paused = true;
  }
}