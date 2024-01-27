contract c16048{
  /**
   * @dev Alias of `safeTransferFrom(from, to, assetId, '')`
   *
   * @param from address that currently owns an asset
   * @param to address to receive the ownership of the asset
   * @param assetId uint256 ID of the asset to be transferred
   */
  function safeTransferFrom(address from, address to, uint256 assetId) external {
    return _doTransferFrom(from, to, assetId, '', msg.sender, true);
  }
}