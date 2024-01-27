contract c11654{
  /**
  * @notice Approves another address to claim for the ownership of the given token ID
  * @param _to address to be approved for the given token ID
  * @param _tokenId uint256 ID of the token to be approved
  */
  function approve(address _to, uint256 _tokenId)
    external
    onlyOwnerOf(_tokenId)
  {
    address _owner = ownerOf(_tokenId);
    require(_to != _owner, "already owns");
    if (getApproved(_tokenId) != 0 || _to != 0) {
      tokenApprovals[_tokenId] = _to;
      emit Approval(_owner, _to, _tokenId);
    }
  }
}