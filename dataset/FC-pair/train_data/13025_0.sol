contract c13025{
  // The upper bound of the number returns is 2^bits - 1
  function bitSlice(uint256 n, uint256 bits, uint256 slot) public pure returns(uint256) {
      uint256 offset = slot * bits;
      // mask is made by shifting left an offset number of times
      uint256 mask = uint256((2**bits) - 1) << offset;
      // AND n with mask, and trim to max of 5 bits
      return uint256((n & mask) >> offset);
  }
}