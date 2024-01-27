contract c7021{
  /**
   * @dev Throws if called by any account other than the congress.
   */
  modifier onlyDiscussable() {
    require(msg.sender == congress);
    _;
  }
}