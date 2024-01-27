contract c8306{
  /**
   * @dev When the crowdsale ends, tokens left are sent to the affiliate address and crowdsale is terminated
   */
  function terminateCrowdSale() onlyOwner public {
    require(crowdSaleEnded);
    uint256 remainingTokens = tkn.balanceOf(address(this));
    require(tkn.transfer(affiliatesAddress, remainingTokens));
    selfdestruct(owner);
  }
}