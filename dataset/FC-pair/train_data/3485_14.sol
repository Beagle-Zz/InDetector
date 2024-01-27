contract c3485{
  // @return true if the transaction can buy tokens
  function validPurchase() internal view returns (bool) {
    bool tokenMintingFinished = token.mintingFinished();
    bool withinCap = token.totalSupply().add(tokensForWei(msg.value)) <= cap;
    bool withinPeriod = now <= endTime;
    bool nonZeroPurchase = msg.value != 0;
    bool moreThanMinimumPayment = msg.value >= 0.1 ether;
    return !tokenMintingFinished && withinCap && withinPeriod && nonZeroPurchase && moreThanMinimumPayment;
  }
}