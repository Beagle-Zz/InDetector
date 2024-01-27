contract c2095{
  /**
   * @dev only the owner
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
}