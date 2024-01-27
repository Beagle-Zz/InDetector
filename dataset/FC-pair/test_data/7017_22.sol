contract c7017{
  /** 
   * @dev Clears the current approval of a given NFT ID.
   * @param _tokenId ID of the NFT to be transferred.
   */
  function clearApproval(
    uint256 _tokenId
  )
    private
  {
    if(idToApprovals[_tokenId] != 0)
    {
      delete idToApprovals[_tokenId];
    }
  }
}