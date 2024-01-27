contract c66{
  // Returns the number of payment destinations and amounts pushed to the storage buffer -
  function paid() internal pure returns (uint num_paid) {
    if (buffPtr() == bytes32(0))
      return 0;
    // Load number paid from buffer -
    assembly { num_paid := mload(0x160) }
  }
}