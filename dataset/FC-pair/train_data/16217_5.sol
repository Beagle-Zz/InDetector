contract c16217{
  /**
   * Sets the minimum amount of user stakes
   * @param amount the new minimum
   * */
  function setMinStakingAmount(uint amount) public onlyAuthorized {
    minStakingAmount = amount;
  }
}