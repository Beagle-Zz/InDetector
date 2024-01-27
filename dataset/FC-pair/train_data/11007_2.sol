contract c11007{
  /**
   * @dev Throws if contract is paused
   */
  modifier isNotPaused() {
    require(!paused);
    _;
  }
}