contract c8700{
  // @return true if the transaction can buy tokens
  function validPurchase() internal constant returns (bool) {
    bool withinPeriod = now >= startTime && now <= endTime;
    bool nonZeroPurchase = msg.value != 0;
    bool withinContributionLimit = msg.value >= minimumContribution && msg.value <= maximumContribution;
    return withinPeriod && nonZeroPurchase && withinContributionLimit;
  }
}