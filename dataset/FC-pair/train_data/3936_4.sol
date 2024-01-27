contract c3936{
  /**
   * @dev Throws if contract is paused
   */
  modifier isNotPaused() {
    require(!paused);
    _;
  }
}