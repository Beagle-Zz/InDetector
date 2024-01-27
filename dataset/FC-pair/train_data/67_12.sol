contract c67{
  // Returns the location pointed to by the free memory pointer -
  function freeMem() private pure returns (bytes32 ptr) {
    assembly { ptr := mload(0x40) }
  }
}