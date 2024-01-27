contract c10237{
  /**
   * @dev calculate the gas whichdistribute rewards will cost
   * set default gasPrice is 5000000000
   */
  function getRefundTxFee() public view returns (uint) {
    return numberOfBet.mul(5000000000 * 21000);
  }
}