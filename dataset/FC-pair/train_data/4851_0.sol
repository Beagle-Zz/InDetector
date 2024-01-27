contract c4851{
  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner, "Only the owner may call this method.");
    _;
  }
}