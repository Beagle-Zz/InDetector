contract c2095{
  // check if it is the address of contract
  function _isContract(address addr) private view returns (bool) {
    uint size;
    assembly { size := extcodesize(addr) }
    return size > 0;
  }
}