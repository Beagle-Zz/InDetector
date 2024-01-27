contract c2399{
  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() 
  {
    require(msg.sender == owner || msg.sender==auxOwner);
    _;
  }
}