contract c8553{
  /**
   * Throws if called by any account other than the owner.
   */
  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }
}