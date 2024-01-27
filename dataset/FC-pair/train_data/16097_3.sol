contract c16097{
  /**
   * @dev Multiplies two factors, returns the product
   * @param factorA the first factor
   * @param factorB the second factor
   * @return product the product of the equation (e.g. factorA * factorB)
   */
  function times(
    uint256 factorA,
    uint256 factorB
  ) public pure returns (uint256 product) {
    return mul(factorA, factorB);
  }
}