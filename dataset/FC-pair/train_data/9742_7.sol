contract c9742{
  /**
   * @dev Reverts if called by any account other than the depositor.
   */
  modifier onlyDepositor() {
    require(msg.sender == depositor, "Only the depositor may call this function.");
    _;
  }
}