contract c13214{
  /**
   * Extract 128-bit worth of data from the bytes stream.
   */
  function slice16(bytes b, uint offset) constant returns (bytes16) {
    bytes16 out;
    for (uint i = 0; i < 16; i++) {
      out |= bytes16(b[offset + i] & 0xFF) >> (i * 8);
    }
    return out;
  }
}