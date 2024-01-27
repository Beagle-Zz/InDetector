contract c11536{
  /// @dev Assigns ownership of a specific Player to an address.
  function _transfer(address _from, address _to, uint256 _tokenId) private {
    // Since the number of Players is capped to 2^32 we can't overflow this
    ownershipTokenCount[_to]++;
    //transfer ownership
    PlayerIndexToOwner[_tokenId] = _to;
    // When creating new Players _from is 0x0, but we can't account that address.
    if (_from != address(0)) {
      ownershipTokenCount[_from]--;
      // clear any previously approved ownership exchange
      delete PlayerIndexToApproved[_tokenId];
    }
    // Emit the transfer event.
    emit Transfer(_from, _to, _tokenId);
  }
}