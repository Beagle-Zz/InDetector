contract c2977{
  /**
  * Validates the purchase (period, minimum amount, within cap)
  * @return {bool} valid
  */
  function validPurchase() internal constant returns (bool) {
    uint256 current = now;
    bool presaleStarted = (current >= startTime || started);
    bool presaleNotEnded = current <= endTime;
    bool nonZeroPurchase = msg.value != 0;
    return nonZeroPurchase && presaleStarted && presaleNotEnded;
  }
}