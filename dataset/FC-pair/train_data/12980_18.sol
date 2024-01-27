contract c12980{
  /**
   * @dev Modifier to make a function callable only when unsold tokens are burnt.
   */
  modifier whenBurnt() {
    require(burnt);
    _;
  }
}