contract c16048{
  //
  // Transaction related operations
  //
  modifier onlyHolder(uint256 assetId) {
    require(_ownerOf(assetId) == msg.sender);
    _;
  }
}