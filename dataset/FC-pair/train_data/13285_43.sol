contract c13285{
  /// For checking approval of transfer for address _to
  function _approvedGen1(address _to, uint256 _tokenId) private view returns (bool) {
    return personIndexToApprovedGen1[_tokenId] == _to;
  }
}