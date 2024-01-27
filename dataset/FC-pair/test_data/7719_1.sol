contract c7719{
  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyMintOwner() {
    require(msg.sender == mintOwner);
    _;
  }
}