contract c65{
  // Returns the number of storage slots pushed to the storage buffer -
  function stored() internal pure returns (uint num_stored) {
    if (buffPtr() == bytes32(0))
      return 0;
    // Load number stored from buffer -
    assembly { num_stored := mload(0x120) }
  }
}