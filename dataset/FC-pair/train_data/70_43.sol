contract c70{
  // Returns the number of events pushed to the storage buffer -
  function emitted() internal pure returns (uint num_emitted) {
    if (buffPtr() == bytes32(0))
      return 0;
    // Load number emitted from buffer -
    assembly { num_emitted := mload(0x140) }
  }
}