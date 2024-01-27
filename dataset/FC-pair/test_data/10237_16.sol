contract c10237{
  /**
   * @dev in order to let more people participant, dealer can recharge
   */
  function rechargeDeposit() public payable {
    require(msg.value >= betInfo.minimumBet);
    betInfo.deposit = betInfo.deposit.add(msg.value);
  }
}