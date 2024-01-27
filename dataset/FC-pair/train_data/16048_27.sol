contract c16048{
  //
  // LAND Update
  //
  function updateLandData(int x, int y, string data) external onlyUpdateAuthorized (_encodeTokenId(x, y)) {
    return _updateLandData(x, y, data);
  }
}