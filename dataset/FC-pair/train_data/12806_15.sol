contract c12806{
  /**
   * @notice Tells whether the msg.sender is approved for the given token ID or not
   * @param _asker address of asking for approval
   * @param _tokenId uint256 ID of the token to query the approval of
   * @return bool whether the msg.sender is approved for the given token ID or not
   */
  function isSpecificallyApprovedFor(address _asker, uint256 _tokenId) internal view returns (bool) {
    return getApproved(_tokenId) == _asker;
  }
}