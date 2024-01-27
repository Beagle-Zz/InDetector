contract c7227{
  // overriding Crowdsale#validPurchase to add capped sale logic
  // @return true if the transaction can buy tokens
  function validPurchase(uint256 tokens) internal view returns (bool) {
    bool withinPeriod = now >= startTime && now <= endTime;
    bool withinCap = soldTokens.add(tokens) <= hardCap;
    bool withinTotalSupply = soldTokens.add(tokens) <= totalTokenSupply;
    bool nonZeroPurchase = msg.value != 0;
    return withinPeriod && nonZeroPurchase && withinCap && withinTotalSupply;
  }
}