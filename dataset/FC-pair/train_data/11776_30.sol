contract c11776{
  /**
   * Extract Ethereum address worth of data from the bytes stream.
   */
  function sliceAddress(bytes b, uint offset) constant returns (address) {
    bytes32 out;
    for (uint i = 0; i < 20; i++) {
      out |= bytes32(b[offset + i] & 0xFF) >> ((i+12) * 8);
    }
    return address(uint(out));
  }
}