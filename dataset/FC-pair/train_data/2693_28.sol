contract c2693{
  /**
   * @dev Check if a given address currently has transferApproval for a particular token.
   * @param _claimant The address we are confirming token is approved for
   * @param _tokenId Token id, only valid when > 0
   */
  function _approvedFor(
    address _claimant,
    uint256 _tokenId
  )
    internal
    view
    returns (bool)
  {
    return tokenIndexToApproved[_tokenId] == _claimant;
  }
}