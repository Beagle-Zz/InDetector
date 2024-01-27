contract c7017{
  /**
   * @dev Actually preforms the transfer.
   * @notice Does NO checks.
   * @param _to Address of a new owner.
   * @param _tokenId The NFT that is being transferred.
   */
  function _transfer(
    address _to,
    uint256 _tokenId
  )
    private
  {
    address from = idToOwner[_tokenId];
    clearApproval(_tokenId);
    removeNFToken(from, _tokenId);
    addNFToken(_to, _tokenId);
    emit Transfer(from, _to, _tokenId);
  }
}