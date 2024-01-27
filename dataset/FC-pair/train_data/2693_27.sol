contract c2693{
  /**
   * @dev Check claimant address as token owner.
   * @param _claimant The address we are validating against
   * @param _tokenId Token id, only valid when > 0
   */
  function _owns(
    address _claimant,
    uint256 _tokenId
  )
    internal
    view
    returns (bool)
  {
    return tokenIndexToOwner[_tokenId] == _claimant;
  }
}