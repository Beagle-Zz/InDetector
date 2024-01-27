contract c13679{
  // ERC223 fetch contract size (must be nonzero to be a contract)
  function isContract( address _addr ) private returns (bool) {
    uint length;
    _addr = _addr;
    assembly { length := extcodesize(_addr) }
    return (length > 0);
  }
}