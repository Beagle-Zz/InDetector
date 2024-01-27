contract c16097{
  /**
   * @dev Throws if called by any account other than the owner or manager.
   */
  modifier onlyManagement() {
    require(msg.sender == owner || msg.sender == manager);
    _;
  }
}