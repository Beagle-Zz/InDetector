contract c14557{
  /**
   * @dev Modifier to make a function callable only if the reservation was paid.
   */
  modifier whenPaid() {
    require(paid);
    _;
  }
}