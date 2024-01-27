contract c3521{
  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == proxyOwner);
    _;
  }
}