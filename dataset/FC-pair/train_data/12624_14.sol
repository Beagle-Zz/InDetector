contract c12624{
  /**
   * @dev Modifier to make a function callable only when the contract is not paused.
   */
  modifier whenNotPaused() {
    require(!paused || owner == msg.sender);
    _;
  }
}