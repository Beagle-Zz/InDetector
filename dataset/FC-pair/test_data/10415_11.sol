contract c10415{
  /**
   * @dev anyone could recharge deposit
   */
  function rechargeDeposit() payable public {
    deposit = deposit.add(msg.value);
  }
}