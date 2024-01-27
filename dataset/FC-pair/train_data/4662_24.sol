contract c4662{
  /// @dev Assigns ownership of a specific Person to an address.
  function _transfer(address _from, address _to, uint256 _tokenId) private {
    // Since the number of persons is capped to 2^32 we can't overflow this
    ownershipTokenCount[_to]++;
    //transfer ownership
    personIndexToOwner[_tokenId] = _to;
    // When creating new persons _from is 0x0, but we can't account that address.
    if (_from != address(0)) {
      ownershipTokenCount[_from]--;
      // clear any previously approved ownership exchange
      delete personIndexToApproved[_tokenId];
    }
    // Emit the transfer event.
    Transfer(_from, _to, _tokenId);
  }
}