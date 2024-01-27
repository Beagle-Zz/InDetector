contract c2693{
  /**
   * @dev Assigns ownership of a specific token to an address.
   */
  function _transfer(
    address _from,
    address _to,
    uint256 _tokenId
  )
    internal
  {
    ownershipTokenCount[_to]++;
    // Transfer ownership
    tokenIndexToOwner[_tokenId] = _to;
    // When creating new token _from is 0x0, but we can't account that address
    if (_from != address(0)) {
      ownershipTokenCount[_from]--;
      // Clear any previously approved ownership exchange
      delete tokenIndexToApproved[_tokenId];
    }
    emit Transfer(_from, _to, _tokenId);
  }
}