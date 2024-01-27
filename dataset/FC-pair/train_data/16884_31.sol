contract c16884{
  // backers refund their ETH if the crowdsale was cancelled or has failed
  function refund() public
  {
    // either cancelled or failed
    require(stopped || isFailed());
    uint256 weiDonated = participants[msg.sender].weiDonated;
    uint256 tokens = participants[msg.sender].tokensGiven;
    // prevent from doing it twice
    require(weiDonated > 0);
    participants[msg.sender].weiDonated = 0;
    participants[msg.sender].tokensGiven = 0;
    msg.sender.transfer(weiDonated);
    //this must be approved by investor
    token.transferFromByCrowdsale(msg.sender, token.forSale(), tokens);
  }
}