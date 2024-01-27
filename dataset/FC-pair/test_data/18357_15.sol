contract c18357{
  /**
   * @dev Modifier to make a function callable only when the contract is paused.
   */
  modifier whenInEmergencyProtectedMode() {
    require(emergencyProtectedMode);
    _;
  }
}