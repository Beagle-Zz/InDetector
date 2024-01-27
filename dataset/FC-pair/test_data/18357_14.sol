contract c18357{
  /**
   * @dev Modifier to make a function callable only when the contract is not paused.
   */
  modifier whenNotInEmergencyProtectedMode() {
    require(!emergencyProtectedMode);
    _;
  }
}