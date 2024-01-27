contract c65{
  // Pushes an amount of wei to forward to the buffer
  function pay(uint _amount) conditions(validPayAmt, validPayDest) internal pure returns (uint) {
    assembly {
      // Get pointer to buffer length -
      let ptr := add(0x20, mload(0xc0))
      // Push payment amount to the end of the buffer -
      mstore(add(0x20, add(ptr, mload(ptr))), _amount)
      // Increment buffer length - 0x20 plus the previous length
      mstore(ptr, add(0x20, mload(ptr)))
      // Set the expected next function - PAY_DEST
      mstore(0x100, 7)
      // Increment PAYS action length -
      mstore(
        mload(sub(ptr, 0x20)),
        add(1, mload(mload(sub(ptr, 0x20))))
      )
      // Update number of payment destinations to be pushed to -
      mstore(0x160, add(1, mload(0x160)))
    }
    // Update free memory pointer
    setFreeMem();
    return _amount;
  }
}