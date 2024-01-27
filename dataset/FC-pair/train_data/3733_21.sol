contract c3733{
  /**
   * @dev Modifier to make a function callable only when the contract is not terminated.
   */
  modifier whenNotTerminated() {
    require(!terminated);
    _;
  }
}