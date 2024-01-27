contract c16884{
  // project's owner withdraws ETH funds to the funding address upon successful crowdsale
  function withdraw(uint256 _amount) public // can be done partially
    onlyOwner() // project's owner
    hasntStopped()  // crowdsale wasn't cancelled
    whenCrowdsaleSuccessful() // crowdsale completed successfully
  {
    require(_amount <= address(this).balance);
    fundingAddress.transfer(_amount);
  }
}