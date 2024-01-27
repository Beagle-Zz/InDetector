contract c2593{
  // Only owner address can set maxProfitAsPercentOfHouse
  function ownerSetMaxProfitAsPercentOfHouse(uint newMaxProfitAsPercent) public
  onlyOwner
  {
    // Restricts each bet to a maximum profit of 20% contractBalance
    require(newMaxProfitAsPercent <= 200000);
    maxProfitAsPercentOfHouse = newMaxProfitAsPercent;
    setMaxProfit();
  }
}