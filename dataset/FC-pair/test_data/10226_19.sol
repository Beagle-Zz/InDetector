contract c10226{
  /**
   * @dev returns the redemptionPaused status from contract storage
   */
  function redemptionPaused() public view returns (bool) {
    return rocketStorage.getBool(keccak256("token.redemptionPaused"));
  }
}