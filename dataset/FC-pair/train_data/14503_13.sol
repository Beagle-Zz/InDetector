contract c14503{
  /**
   * @dev Modifier to make a function callable only if the reservation was not yet paid.
   */
  modifier whenNotPaid() {
    require(!paid);
    _;
  }
}