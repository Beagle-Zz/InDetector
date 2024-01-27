contract c18467{
  // returns % of any number, where % given was generated with toPct
  function _applyPct (uint numerator, uint pct) internal pure returns (uint) {
    return numerator.mul(pct) / (10 ** 20);
  }
}