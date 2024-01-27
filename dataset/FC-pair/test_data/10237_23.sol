contract c10237{
  /**
   * @dev dealer can withdraw the remain ether after refund or closed
   */
  function withdraw() internal {
    require(isBetClosed);
    uint _balance = address(this).balance;
    betInfo.dealer.transfer(_balance);
    LogDealerWithdraw(betInfo.dealer, _balance);
  }
}