contract c13315{
  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == ownerAddress);
    _;
  }
}