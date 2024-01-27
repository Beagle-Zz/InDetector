contract c67{
  // Push an address to forward wei to, to the buffer
  function toAcc(uint, address _dest) conditions(validPayDest, validPayAmt) internal pure {
    assembly {
      // Get pointer to buffer length -
      let ptr := add(0x20, mload(0xc0))
      // Push payment destination to the end of the buffer -
      mstore(add(0x20, add(ptr, mload(ptr))), _dest)
      // Increment buffer length - 0x20 plus the previous length
      mstore(ptr, add(0x20, mload(ptr)))
      // Set the expected next function - PAY_AMT
      mstore(0x100, 8)
    }
    // Update free memory pointer
    setFreeMem();
  }
}