contract c7793{
  /**
   * function validPurchase - Checks the purchase is valid or not
   * @return true - Purchase is withPeriod and nonZero
   */
  function validPurchase() internal constant returns (bool) {
    bool withinPeriod = now >= privateSaleStartTime && now <= privateSaleEndTime;
    bool nonZeroPurchase = msg.value != 0;
    return withinPeriod && nonZeroPurchase;
  }
}