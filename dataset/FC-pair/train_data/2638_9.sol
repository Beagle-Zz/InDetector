contract c2638{
  /*
  * Sets max profit
  */
  function setMaxProfit() internal {
    emit CurrentContractBalance(contractBalance);
    maxProfit = (contractBalance * maxProfitAsPercentOfHouse) / maxProfitDivisor;
  }
}