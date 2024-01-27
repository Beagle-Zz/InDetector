contract c11586{
  // @return true if the transaction can buy tokens
  function validPurchase() internal view returns (bool) {
    bool withinPeriod = startTime > 0 && !isFinished;
    bool validAmount = msg.value >= (minimumSupply * 10**18 * rate).div(10000);
    return withinPeriod && validAmount;
  }
}