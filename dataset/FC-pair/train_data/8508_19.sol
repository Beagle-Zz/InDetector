contract c8508{
  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyPauseOperator() {
    require(msg.sender == pauseOperator || msg.sender == owner);
    _;
  }
}