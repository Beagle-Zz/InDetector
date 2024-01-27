contract c8557{
  /**
   * @dev Removes authority to execute several functions from subOwner.
   * @param _authority The address to remove authority from.
   */
  function removeAuthority(address _authority) onlyOwner public {
    authorities[_authority] = false;
    emit AuthorityRemoved(_authority);
  }
}