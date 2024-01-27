contract c10040{
  /*
   * The constructor for the crowdsale was removed given it didn't receive any arguments nor had any body.
   *
   * The configuration from the constructor was moved to the configurationCrowdsale function which creates the token contract and also calls the configuration functions from GenericCrowdsale and TokenTranchePricing.
   * 
   *
   * @param team_multisig Address of the multisignature wallet of the team that will receive all the funds contributed in the crowdsale.
   * @param start Timestamp where the crowdsale will be officially started. It should be greater than the timestamp in which the contract is deployed.
   * @param end Timestamp where the crowdsale finishes. No tokens can be sold through this contract after this timestamp.
   * @param token_retriever Address that will handle tokens accidentally sent to the token contract. See the LostAndFoundToken and CrowdsaleToken contracts for further details.
   */
  function configurationCrowdsale(address team_multisig, uint start, uint end,
  address token_retriever, uint[] init_tranches, uint multisig_supply, uint crowdsale_supply,
  uint8 token_decimals) public onlyOwner {
    initial_tokens = multisig_supply;
    minimum_buy_value = uint(100).mul(10 ** uint(token_decimals));
    token = new CrowdsaleToken(multisig_supply, token_decimals, team_multisig, token_retriever);
    // Necessary if assignTokens mints
    token.setMintAgent(address(this), true);
    // Necessary if finalize is overriden to release the tokens for public trading.
    token.setReleaseAgent(address(this));
    // Necessary for the execution of buy function and of the subsequent CrowdsaleToken's transfer function. 
    token.setTransferAgent(address(this), true);
    // Necessary for the delivery of bounties 
    token.setTransferAgent(team_multisig, true);
    // Crowdsale mints to himself the initial supply
    token.mint(address(this), crowdsale_supply);
    // Necessary if assignTokens mints
    token.setMintAgent(address(this), false);
    sellable_tokens = crowdsale_supply;
    // Configuration functionality for GenericCrowdsale.
    configurationGenericCrowdsale(team_multisig, start, end);
    // Configuration functionality for TokenTranchePricing.
    configurationTokenTranchePricing(init_tranches);
  }
}