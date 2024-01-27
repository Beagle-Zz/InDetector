contract c11780{
  /**
   * Extract 32-bit worth of data from the bytes stream.
   */
  function slice4(bytes b, uint offset) constant returns (bytes4) {
    bytes4 out;
    for (uint i = 0; i < 4; i++) {
      out |= bytes4(b[offset + i] & 0xFF) >> (i * 8);
    }
    return out;
  }
}