contract c72{
  // Begins creating a storage buffer - values and locations pushed will be committed
  // to storage at the end of execution
  function storing() conditions(validStoreBuff, isStoring) internal pure {
    bytes4 action_req = STORES;
    assembly {
      // Get pointer to buffer length -
      let ptr := add(0x20, mload(0xc0))
      // Push requestor to the end of buffer, as well as to the 'current action' slot -
      mstore(add(0x20, add(ptr, mload(ptr))), action_req)
      // Push '0' to the end of the 4 bytes just pushed - this will be the length of the STORES action
      mstore(add(0x24, add(ptr, mload(ptr))), 0)
      // Increment buffer length - 0x24 plus the previous length
      mstore(ptr, add(0x24, mload(ptr)))
      // Set the current action being executed (STORES) -
      mstore(0xe0, action_req)
      // Set the expected next function - STORE_DEST
      mstore(0x100, 2)
      // Set a pointer to the length of the current request within the buffer
      mstore(sub(ptr, 0x20), add(ptr, mload(ptr)))
    }
    // Update free memory pointer
    setFreeMem();
  }
}