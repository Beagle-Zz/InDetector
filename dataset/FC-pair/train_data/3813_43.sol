contract c3813{
  /**
    * sets percentage for bounty's wallet
    * @param newBountyTokensPercent new percentage for bounty's wallet
    */
  function setBountyTokensPercent(uint newBountyTokensPercent) public onlyOwner {
    bountyTokensPercent = newBountyTokensPercent;
  }
}