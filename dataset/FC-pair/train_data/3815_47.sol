contract c3815{
  /**
    * sets address for bountys's wallet
    * @param newBountyTokensWallet new address for bountys's wallet
    */
  function setBountyTokensWallet(address newBountyTokensWallet) public onlyOwner {
    bountyTokensWallet = newBountyTokensWallet;
  }
}