contract c11005{
  /**
   * @dev Throws if contract is paused
   */
  modifier isNotPaused() {
    require(!paused);
    _;
  }
}