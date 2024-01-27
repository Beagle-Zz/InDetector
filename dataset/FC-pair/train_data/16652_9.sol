contract c16652{
  /**
   * @dev modifier to allow actions only when the contract IS not paused
   */
  modifier whenNotPaused() {
    require(now >= endDate);
    _;
  }
}