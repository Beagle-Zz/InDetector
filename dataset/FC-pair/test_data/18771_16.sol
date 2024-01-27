contract c18771{
  // backers refund their ETH if the crowdsale was cancelled or has failed
  function refund()
    public
  {
    // either cancelled or failed
    require(stopped || isFailed());
    uint256 amount = participants[msg.sender];
    // prevent from doing it twice
    require(amount > 0);
    participants[msg.sender] = 0;
    msg.sender.transfer(amount);
  }
}