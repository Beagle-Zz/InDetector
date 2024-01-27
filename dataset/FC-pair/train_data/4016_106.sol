contract c4016{
  // @dev Retreive order based on given array _by.
  function getOrder(uint32[8] _by)
    private pure
    returns (uint8[8])
  {
    uint8[8] memory _order = [uint8(0), 1, 2, 3, 4, 5, 6, 7];
    for (uint8 i = 0; i < 8; i ++) {
      for (uint8 j = i + 1; j < 8; j++) {
        if (_by[i] < _by[j]) {
          uint32 tmp1 = _by[i];
          _by[i] = _by[j];
          _by[j] = tmp1;
          uint8 tmp2 = _order[i];
          _order[i] = _order[j];
          _order[j] = tmp2;
        }
      }
    }
    return _order;
  }
}