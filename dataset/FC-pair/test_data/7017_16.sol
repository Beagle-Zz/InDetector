contract c7017{
  /**
   * @dev Get the approved address for a single NFT.
   * @notice Throws if `_tokenId` is not a valid NFT.
   * @param _tokenId ID of the NFT to query the approval of.
   */
  function getApproved(
    uint256 _tokenId
  )
    public
    view
    validNFToken(_tokenId)
    returns (address)
  {
    return idToApprovals[_tokenId];
  }
}