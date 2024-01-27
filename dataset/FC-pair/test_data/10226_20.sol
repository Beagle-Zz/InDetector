contract c10226{
  /**
   * @dev called by the owner to pause, triggers stopped state
   */
  function pauseRedemption() onlyOwner whenRedemptionNotPaused public {
    rocketStorage.setBool(keccak256("token.redemptionPaused"), true);
    emit PauseRedemption();
  }
}