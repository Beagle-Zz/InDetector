contract c11859{
  //
  // LAND Getters
  //
  function encodeTokenId(int x, int y) pure external returns (uint) {
    return _encodeTokenId(x, y);
  }
}