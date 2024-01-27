contract c7489{
  /// @dev Finalizes the crowdsale
  function finalize() external onlyOwner {
    _finalization();
  }
}