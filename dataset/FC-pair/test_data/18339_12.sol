contract c18339{
  /**
   * adjust tranche for next cycle
   */
  function adjustNextTranche (uint8 numerator, uint8 denominator) onlyOwner public {
    require(numerator > 0 && denominator > 0);
    trancheNumerator = numerator;
    trancheDenominator = denominator;
  }
}