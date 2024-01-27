contract c3814{
  /**
    * Calculates and records contributions
    * @param to invesyor's adress to transfer the minted tokens to
    * @param weiInvested number of wei invested
    */
  function calculateAndMintTokens(address to, uint weiInvested) internal {
    //calculate number of tokens
    uint stageIndex = currentStage();
    Stage storage stage = stages[stageIndex];
    uint tokens = weiInvested.mul(stage.price);
    //if we have a new contributor
    if(investedAmountOf[msg.sender] == 0) {
        contributors[uniqueContributors] = msg.sender;
        uniqueContributors += 1;
    }
    //record contribution and tokens assigned
    investedAmountOf[msg.sender] = investedAmountOf[msg.sender].add(weiInvested);
    tokenAmountOf[msg.sender] = tokenAmountOf[msg.sender].add(tokens);
    //mint and update invested values
    mintTokens(to, tokens);
    totalInvested = totalInvested.add(weiInvested);
    stage.invested = stage.invested.add(weiInvested);
    //check if cap of staged is reached
    if(stage.invested >= stage.hardcap) {
      stage.closed = now;
    }
  }
}