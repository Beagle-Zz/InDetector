contract c11776{
  /**
   * Extract 256-bit worth of data from the bytes stream.
   */
  function slice32(bytes b, uint offset) constant returns (bytes32) {
    bytes32 out;
    for (uint i = 0; i < 32; i++) {
      out |= bytes32(b[offset + i] & 0xFF) >> (i * 8);
    }
    return out;
  }
}