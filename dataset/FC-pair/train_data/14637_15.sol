contract c14637{
  // @return true if the transaction can buy tokens
  function validPurchase() internal view {
    require(msg.value != 0);
    require(remainingTokens() > 0,"contract doesn't have tokens");
    require(now >= startTime && now <= endTime);
  }
}