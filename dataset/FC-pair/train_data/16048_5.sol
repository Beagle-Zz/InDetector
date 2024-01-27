contract c16048{
  //
  // Asset-centric getter functions
  //
  /**
   * @dev Queries what address owns an asset. This method does not throw.
   * In order to check if the asset exists, use the `exists` function or check if the
   * return value of this call is `0`.
   * @return uint256 the assetId
   */
  function ownerOf(uint256 assetId) external view returns (address) {
    return _ownerOf(assetId);
  }
}