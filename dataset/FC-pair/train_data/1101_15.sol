contract c1101{
    // Sets max profit (internal)
    function setMaxProfit(uint divRate) internal {
      maxProfit[divRate] = (contractBalance[divRate] * maxProfitAsPercentOfHouse) / maxProfitDivisor; 
    } 
}