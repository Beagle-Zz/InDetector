contract c16048{
  /**
   * @dev Method to check if an asset identified by the given id exists under this DAR.
   * @return uint256 the assetId
   */
  function exists(uint256 assetId) external view returns (bool) {
    return _exists(assetId);
  }
}