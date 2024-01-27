contract c7201{
  // @dev Collect service/affiliate fee for a sell
  function collectSellFee(address affiliate) internal returns(uint) {
    uint fee = feeWallet.getFee(address(this).balance);
    feeWallet.collect.value(fee)(affiliate);
    return address(this).balance;
  }
}