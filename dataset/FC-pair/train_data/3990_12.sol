contract c3990{
  /**
  * @dev Return ownership to previous owner
  */
  function returnOwnership() onlyOwner public returns (bool) {
    token.transferOwnership(owner);
  }
}