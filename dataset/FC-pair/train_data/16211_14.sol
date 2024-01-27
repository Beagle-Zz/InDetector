contract c16211{
  /**
   * @dev Modifier to make a function callable only when the contract is not paused
   * or when the owner is invoking the function.
   */
  modifier whenNotPaused() {
    require(!paused || msg.sender == owner);
    _;
  }
}