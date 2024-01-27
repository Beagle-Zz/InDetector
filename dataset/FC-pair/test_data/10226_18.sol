contract c10226{
  /**
   * @dev Modifier to make a function callable only when the contract redemption is paused.
   */
  modifier whenRedemptionPaused() {
    require(redemptionPaused());
    _;
  }
}