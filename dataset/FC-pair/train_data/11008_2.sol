contract c11008{
  /**
   * @dev Throws if contract is paused
   */
  modifier isNotPaused() {
    require(!paused);
    _;
  }
}