contract c7464{
  /**
   * @dev Performs the finalization tasks:
   * - if goal reached, activate the controller and burn the remaining tokens
   * - transfer the ownership of the token contract back to the owner.
   */
  function finalization() internal {
    // only when the goal is reached we burn the tokens and activate the controller.
    if (goalReached()) {
      // activate the controller to enable the investors and team members 
      // to claim their tokens when the time comes.
      timelockController.activate();
      // calculate the quantity of tokens to be burnt. The bonuses are already transfered to the Controller.
      uint256 balance = token.balanceOf(this);
      uint256 remainingTokens = balance.sub(tokensToBeDelivered);
      if (remainingTokens>0) {
        BurnableTokenInterface(address(token)).burn(remainingTokens);
      }
    }
    Ownable(address(token)).transferOwnership(owner);
    super.finalization();
  }
}