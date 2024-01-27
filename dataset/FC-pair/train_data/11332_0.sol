contract c11332{
  /**
   * @dev Throws if called by any account other than the owner. 
   */
  modifier onlyOwner() {
    require(owner==msg.sender);
    _;
 }
}