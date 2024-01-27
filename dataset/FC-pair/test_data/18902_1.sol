contract c18902{
  /**
   * @dev modifier to allow actions only when the contract IS NOT paused
   */
  modifier whenPaused {
    require(true == paused);
    _;
  }
}