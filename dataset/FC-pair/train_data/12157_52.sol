contract c12157{
  /**
   * @dev This method refunds all the contribution that _purchaser has done
   * @param _purchaser Token purchaser asking for refund
   */
  function refund(address _purchaser) public onlyOwner {
    uint256 amountToRefund = contributions[_purchaser];
    require(amountToRefund > 0);
    require(weiRaised >= amountToRefund);
    require(address(this).balance >= amountToRefund);
    contributions[_purchaser] = 0;
    uint256 _tokens = _getTokenAmount(amountToRefund);
    weiRaised = weiRaised.sub(amountToRefund);
    _purchaser.transfer(amountToRefund);
    emit Refund(_purchaser, _tokens, amountToRefund);
  }
}