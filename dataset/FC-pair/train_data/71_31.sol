contract c71{
  // Sets a passed in location to a value passed in via 'to'
  function set(bytes32 _field) conditions(validStoreDest, validStoreVal) internal pure returns (bytes32) {
    assembly {
      // Get pointer to buffer length -
      let ptr := add(0x20, mload(0xc0))
      // Push storage destination to the end of the buffer -
      mstore(add(0x20, add(ptr, mload(ptr))), _field)
      // Increment buffer length - 0x20 plus the previous length
      mstore(ptr, add(0x20, mload(ptr)))
      // Set the expected next function - VAL_SET
      mstore(0x100, 3)
      // Increment STORES action length -
      mstore(
        mload(sub(ptr, 0x20)),
        add(1, mload(mload(sub(ptr, 0x20))))
      )
      // Update number of storage slots pushed to -
      mstore(0x120, add(1, mload(0x120)))
    }
    // Update free memory pointer
    setFreeMem();
    return _field;
  }
}