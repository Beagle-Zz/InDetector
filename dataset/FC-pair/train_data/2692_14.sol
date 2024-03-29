contract c2692{
  // -----------------------------------------
  // Internal interface
  // -----------------------------------------
  /**
   * @dev Returns true if the claimant owns the token.
   * @param _claimant Address claiming to own the token
   * @param _tokenId ID of token whose ownership to verify
   */
  function _owns(
    address _claimant,
    uint256 _tokenId
  )
    internal
    view
    returns (bool)
  {
    return (tokenContract.ownerOf(_tokenId) == _claimant);
  }
}