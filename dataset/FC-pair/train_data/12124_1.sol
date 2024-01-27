contract c12124{
  // These are internal functions used for calculating fees, eth and token allocations as %
  // returns a value as a % accurate to 20 decimal points
  function _toPct (uint numerator, uint denominator ) internal pure returns (uint) {
    return numerator.mul(10 ** 20) / denominator;
  }
}