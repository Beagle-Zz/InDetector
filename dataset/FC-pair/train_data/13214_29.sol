contract c13214{
  /**
   * Extract 16-bit worth of data from the bytes stream.
   */
  function slice2(bytes b, uint offset) constant returns (bytes2) {
    bytes2 out;
    for (uint i = 0; i < 2; i++) {
      out |= bytes2(b[offset + i] & 0xFF) >> (i * 8);
    }
    return out;
  }
}