contract c8557{
  /**
   * @dev Adds authority to execute several functions to subOwner.
   * @param _authority The address to add authority to.
   */
  function addAuthority(address _authority) onlyOwner public {
    authorities[_authority] = true;
    emit AuthorityAdded(_authority);
  }
}