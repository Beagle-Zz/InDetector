contract c12806{
  /**
  * @notice Transfers the ownership of a given token ID to another address
  * @param _to address to receive the ownership of the given token ID
  * @param _tokenId uint256 ID of the token to be transferred
  */
  function transfer(address _to, uint256 _tokenId)
    external
    onlyOwnerOf(_tokenId)
  {
    _clearApprovalAndTransfer(msg.sender, _to, _tokenId);
  }
}