contract c11462{
  /**
   * @dev Modifier to make a function callable only when the contract is not paused or when sender is whitelisted.
   */
  modifier whenNotPaused() {
    require(!paused || whitelist[msg.sender]);
    _;
  }
}