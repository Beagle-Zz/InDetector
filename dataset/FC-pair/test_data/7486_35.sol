contract c7486{
  /// @dev Finalizes the crowdsale
  function finalize() external onlyOwner {
    _finalization();
  }
}