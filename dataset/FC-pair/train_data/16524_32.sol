contract c16524{
  /// @notice Finalizes the campaign
  ///   Get funds out, generates team, reserve and reserve tokens
  function allocateInvestors() public onlyController {     
    /// only if sale was closed or 48 hours = 2880 minutes have passed since campaign end
    /// we leave this time to complete possibly pending orders from offchain contributions 
    require ( (campaignState == 1) || ((campaignState != 0) && (now > tCampaignEnd + (2880 minutes))));
    uint256 nTokens = 0;
    uint256 rate = 0;
    uint256 contributedAmount = 0; 
    uint256 investorsProcessedEnd = investorsProcessed + investorsBatchSize;
    if (investorsProcessedEnd > joinedCrowdsale.length) {
      investorsProcessedEnd = joinedCrowdsale.length;
    }
    for (uint256 i = investorsProcessed; i < investorsProcessedEnd; i++) {
        investorsProcessed++;
        address investorAddress = joinedCrowdsale[i];
        // PreCrowd stage
        contributedAmount = participantList[investorAddress].contributedAmountPreCrowd;
        if (isWhiteListed) {
            // is contributeAmount within whitelisted amount
            if (contributedAmount > participantWhitelist[investorAddress].maxCap) {
                contributedAmount = participantWhitelist[investorAddress].maxCap;
            }
            // calculate remaining whitelisted amount
            if (contributedAmount>0) {
                participantWhitelist[investorAddress].maxCap = participantWhitelist[investorAddress].maxCap.sub(contributedAmount);
            }
        }
        if (contributedAmount>0) {
            // calculate the number of tokens
            rate = preCrowd_tokens_scaled;
            nTokens = (rate.mul(contributedAmount)).div(1 ether);
            // check whether individual allocations are capped
            if (nTokens > maxPreCrowdAllocationPerInvestor) {
              nTokens = maxPreCrowdAllocationPerInvestor;
            }
            // If tokens are bigger than whats left in the stage, give the rest 
            if (tokensRemainingPreCrowd.sub(nTokens) < 0) {
                nTokens = tokensRemainingPreCrowd;
            }
            // update spent amount
            participantList[joinedCrowdsale[i]].spentAmount = participantList[joinedCrowdsale[i]].spentAmount.add(nTokens.div(rate).mul(1 ether));
            // calculate leftover tokens for the stage 
            tokensRemainingPreCrowd = tokensRemainingPreCrowd.sub(nTokens);
            // update the new token holding
            participantList[investorAddress].allocatedTokens = participantList[investorAddress].allocatedTokens.add(nTokens);
        }
        //  stage1
        contributedAmount = participantList[investorAddress].contributedAmountStage1;
        if (isWhiteListed) {
            // is contributeAmount within whitelisted amount
            if (contributedAmount > participantWhitelist[investorAddress].maxCap) {
                contributedAmount = participantWhitelist[investorAddress].maxCap;
            }
            // calculate remaining whitelisted amount
            if (contributedAmount>0) {
                participantWhitelist[investorAddress].maxCap = participantWhitelist[investorAddress].maxCap.sub(contributedAmount);
            }
        }
        if (contributedAmount>0) {
            // calculate the number of tokens
            rate = stage_1_tokens_scaled;
            nTokens = (rate.mul(contributedAmount)).div(1 ether);
            // check whether individual allocations are capped
            if (nTokens > maxStage1AllocationPerInvestor) {
              nTokens = maxStage1AllocationPerInvestor;
            }
            // If tokens are bigger than whats left in the stage, give the rest 
            if (tokensRemainingStage1.sub(nTokens) < 0) {
                nTokens = tokensRemainingStage1;
            }
            // update spent amount
            participantList[joinedCrowdsale[i]].spentAmount = participantList[joinedCrowdsale[i]].spentAmount.add(nTokens.div(rate).mul(1 ether));
            // calculate leftover tokens for the stage 
            tokensRemainingStage1 = tokensRemainingStage1.sub(nTokens);
            // update the new token holding
            participantList[investorAddress].allocatedTokens = participantList[investorAddress].allocatedTokens.add(nTokens);
        }
        //  stage2
        contributedAmount = participantList[investorAddress].contributedAmountStage2;
        if (isWhiteListed) {
            // is contributeAmount within whitelisted amount
            if (contributedAmount > participantWhitelist[investorAddress].maxCap) {
                contributedAmount = participantWhitelist[investorAddress].maxCap;
            }
            // calculate remaining whitelisted amount
            if (contributedAmount>0) {
                participantWhitelist[investorAddress].maxCap = participantWhitelist[investorAddress].maxCap.sub(contributedAmount);
            }
        }
        if (contributedAmount>0) {
            // calculate the number of tokens
            rate = stage_2_tokens_scaled;
            nTokens = (rate.mul(contributedAmount)).div(1 ether);
            // check whether individual allocations are capped
            if (nTokens > maxStage2AllocationPerInvestor) {
              nTokens = maxStage2AllocationPerInvestor;
            }
            // If tokens are bigger than whats left in the stage, give the rest 
            if (tokensRemainingStage2.sub(nTokens) < 0) {
                nTokens = tokensRemainingStage2;
            }
            // update spent amount
            participantList[joinedCrowdsale[i]].spentAmount = participantList[joinedCrowdsale[i]].spentAmount.add(nTokens.div(rate).mul(1 ether));
            // calculate leftover tokens for the stage 
            tokensRemainingStage2 = tokensRemainingStage2.sub(nTokens);
            // update the new token holding
            participantList[investorAddress].allocatedTokens = participantList[investorAddress].allocatedTokens.add(nTokens);
        }
        //  stage3
        contributedAmount = participantList[investorAddress].contributedAmountStage3;
        if (isWhiteListed) {
            // is contributeAmount within whitelisted amount
            if (contributedAmount > participantWhitelist[investorAddress].maxCap) {
                contributedAmount = participantWhitelist[investorAddress].maxCap;
            }
            // calculate remaining whitelisted amount
            if (contributedAmount>0) {
                participantWhitelist[investorAddress].maxCap = participantWhitelist[investorAddress].maxCap.sub(contributedAmount);
            }
        }
        if (contributedAmount>0) {
            // calculate the number of tokens
            rate = stage_3_tokens_scaled;
            nTokens = (rate.mul(contributedAmount)).div(1 ether);
            // check whether individual allocations are capped
            if (nTokens > maxStage3AllocationPerInvestor) {
              nTokens = maxStage3AllocationPerInvestor;
            }
            // If tokens are bigger than whats left in the stage, give the rest 
            if (tokensRemainingStage3.sub(nTokens) < 0) {
                nTokens = tokensRemainingStage3;
            }
            // update spent amount
            participantList[joinedCrowdsale[i]].spentAmount = participantList[joinedCrowdsale[i]].spentAmount.add(nTokens.div(rate).mul(1 ether));
            // calculate leftover tokens for the stage 
            tokensRemainingStage3 = tokensRemainingStage3.sub(nTokens);
            // update the new token holding
            participantList[investorAddress].allocatedTokens = participantList[investorAddress].allocatedTokens.add(nTokens);
        }
        do_grant_tokens(investorAddress, participantList[investorAddress].allocatedTokens);
    }
  }
}