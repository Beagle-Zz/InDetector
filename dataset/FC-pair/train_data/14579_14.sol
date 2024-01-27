contract c14579{
  /**
   * @dev Modifier to make a function callable only if the reservation was paid.
   */
  modifier whenPaid() {
    require(paid);
    _;
  }
}