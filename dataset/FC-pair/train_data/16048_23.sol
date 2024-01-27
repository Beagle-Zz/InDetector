contract c16048{
  //
  // LAND Create and destroy
  //
  modifier onlyOwnerOf(uint256 assetId) {
    require(msg.sender == _ownerOf(assetId), "this function can only be called by the owner of the asset");
    _;
  }
}