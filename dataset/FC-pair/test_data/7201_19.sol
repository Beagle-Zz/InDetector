contract c7201{
  // @dev Collect service/affiliate fee for a buy
  function collectBuyFee(uint ethers, address affiliate) internal returns(uint) {
    uint remaining;
    uint fee = feeWallet.getFee(ethers);
    //If there is enough remaining to pay fee, it substract from the balance
    if(SafeMath.safeSub(address(this).balance, ethers) >= fee)
      remaining = ethers;
    else
      remaining = SafeMath.safeSub(SafeMath.safeSub(ethers, address(this).balance), fee);
    feeWallet.collect.value(fee)(affiliate);
    return remaining;
  }
}