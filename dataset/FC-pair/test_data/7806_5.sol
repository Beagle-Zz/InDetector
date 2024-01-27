contract c7806{
  // @return true if the transaction can buy tokens
  function validPurchase() internal constant returns (bool) {
    bool nonZeroPurchase = msg.value != 0;
    return nonZeroPurchase;
  }
}