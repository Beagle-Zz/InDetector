contract c10226{
  /**
   * @dev called by the owner to unpause redemption, returns to normal state
   */
  function unpauseRedemption() onlyOwner whenRedemptionPaused public {
    rocketStorage.setBool(keccak256("token.redemptionPaused"), false);
    emit UnpauseRedemption();
  }
}