contract c18346{
  // Finish: Mint Extra Tokens as needed before finalizing the Crowdsale.
  // ====================================================================
  function finish(address _teamFund, address _airdropFund) public onlyOwner {
      require(!isFinalized);
      uint256 alreadyMintedTokens = token.totalSupply();
      require(alreadyMintedTokens < maxTokens);
      uint256 unsoldTokens = totalTokensForSale - alreadyMintedTokens;
      if (unsoldTokens > 0) {
        tokensAirdrop = tokensAirdrop + unsoldTokens;
      }
      token.mint(_airdropFund,tokensAirdrop);
      token.mint(_teamFund,tokensForTeam);
      finalize();
  }
}