contract c11654{
  /**
  * @notice Internal function to clear current approval of a given token ID
  * @param _tokenId uint256 ID of the token to be transferred
  */
  function _clearApproval(address _owner, uint256 _tokenId) private {
    require(ownerOf(_tokenId) == _owner, "wrong owner");
    if (tokenApprovals[_tokenId] != 0) {
      tokenApprovals[_tokenId] = 0;
      emit Approval(_owner, 0, _tokenId);
    }
  }
}