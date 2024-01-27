contract c3686{
  /**
      SETUP RELATED FUNCTIONS
  **/
  /**
   * @dev Sets the initial date and token.
   * @param initialDate A timestamp representing the start of the bonussale
    @param tokenAddress  The address of the deployed SolidToken
   */
  function setupSale(uint256 initialDate, address tokenAddress) onlyOwner atStage(Stages.SETUP) public {
    bonussale_StartDate = initialDate;
    bonussale_EndDate = bonussale_StartDate + BONUSSALE_MAX_DURATION;
    token = ERC20(tokenAddress);
    require(SolidToken(tokenAddress).totalSupply() == 0, "Tokens have already been distributed");
    require(SolidToken(tokenAddress).owner() == address(this), "Token has the wrong ownership");
    currentStage = Stages.READY;
  }
}