contract c66{
  // Sets a previously-passed-in destination in storage to the value
  function to(bytes32, bytes32 _val) conditions(validStoreVal, validStoreDest) internal pure {
    assembly {
      // Get pointer to buffer length -
      let ptr := add(0x20, mload(0xc0))
      // Push storage value to the end of the buffer -
      mstore(add(0x20, add(ptr, mload(ptr))), _val)
      // Increment buffer length - 0x20 plus the previous length
      mstore(ptr, add(0x20, mload(ptr)))
      // Set the expected next function - STORE_DEST
      mstore(0x100, 2)
    }
    // Update free memory pointer
    setFreeMem();
  }
}