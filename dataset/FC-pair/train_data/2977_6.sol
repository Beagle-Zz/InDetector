contract c2977{
  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyController() {
    require(msg.sender == controller);
    _;
  }
}