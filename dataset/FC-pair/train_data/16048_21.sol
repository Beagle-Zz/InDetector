contract c16048{
  /**
   * @notice Enumerate tokens assigned to an owner
   * @dev Throws if `index` >= `balanceOf(owner)` or if
   *  `owner` is the zero address, representing invalid assets.
   *  Otherwise this must not throw.
   * @param owner An address where we are interested in assets owned by them
   * @param index A counter less than `balanceOf(owner)`
   * @return The identifier for the `index`th asset assigned to `owner`,
   *   (sort order not specified)
   */
  function tokenOfOwnerByIndex(
    address owner, uint256 index
  )
    external
    view
    returns (uint256 assetId)
  {
    require(index < _assetsOf[owner].length);
    require(index < (1<<127));
    return _assetsOf[owner][index];
  }
}