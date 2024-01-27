contract c2696{
  // @return true if the transaction can buy tokens
  function validPurchase() internal view returns (bool) {
    // 73 days of sale.
    bool withinPeriod = (now >= startTime && now <= endTime) || msg.sender == owner;
    bool nonZeroPurchase = msg.value != 0;
    bool withinCap = weiRaised.add(msg.value) <= cap;
    return withinPeriod && nonZeroPurchase && withinCap;
  }
}