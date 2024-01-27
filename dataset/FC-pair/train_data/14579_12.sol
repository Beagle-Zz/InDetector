contract c14579{
  /**
   * @dev Modifier to make a function callable only if the reservation was canceled.
   */
  modifier whenCanceled() {
    require(canceled);
    _;
  }
}