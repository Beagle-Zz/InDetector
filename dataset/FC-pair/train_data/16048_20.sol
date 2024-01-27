contract c16048{
  /**
   * @notice Get all tokens of a given address
   * @dev This is not intended to be used on-chain
   * @param owner address of the owner to query
   * @return a list of all assetIds of a user
   */
  function tokensOf(address owner) external view returns (uint256[]) {
    return _assetsOf[owner];
  }
}