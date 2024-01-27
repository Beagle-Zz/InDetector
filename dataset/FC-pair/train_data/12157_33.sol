contract c12157{
  /**
   * @dev Reverts if in crowdsale time range.
   */
  modifier onlyWhileNotOpen {
    require(now < openingTime);
    _;
  }
}