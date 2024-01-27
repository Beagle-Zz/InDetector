contract c16217{
  /**
   * Sets the withdraw gas cost.
   * @param gasCost the new withdraw gas cost
   * */
  function setWithdrawGasCost(uint8 gasCost) public onlyAuthorized {
    withdrawGasCost = gasCost;
  }
}