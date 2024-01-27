contract c18902{
  /**
   * @dev modifier to allow actions only when the contract IS paused
   */
  modifier whenNotPaused() {
    require(false == paused);
    _;
  }
}