contract c16524{
  ///  @notice processes the contribution
  ///   checks campaign state, time window and minimal contribution
  ///   throws if one of the conditions fails
  function process_contribution(address _toAddr) internal {
    require ((campaignState == 2)   // active main sale
         && (now <= tCampaignEnd)   // within time window
         && (paused == false));     // not on hold
    // we check that Eth sent is sufficient 
    // though our token has decimals we don't want nanocontributions
    require ( msg.value >= minContribution );
    amountRaised = amountRaised.add(msg.value);
    // check whether we know this investor, if not add him to list
    if (!participantList[_toAddr].participatedFlag) {
       // A new investor
       participantList[_toAddr].participatedFlag = true;
       joinedCrowdsale.push(_toAddr);
    }
    if ( msg.value >= preCrowdMinContribution ) {
      participantList[_toAddr].contributedAmountPreCrowd = participantList[_toAddr].contributedAmountPreCrowd.add(msg.value);
      // notify the world
      RaisedPreCrowd(_toAddr, msg.value);
    } else {
      if (now <= t_1st_StageEnd) {
        participantList[_toAddr].contributedAmountStage1 = participantList[_toAddr].contributedAmountStage1.add(msg.value);
        // notify the world
        RaisedStage1(_toAddr, msg.value);
      } else if (now <= t_2nd_StageEnd) {
        participantList[_toAddr].contributedAmountStage2 = participantList[_toAddr].contributedAmountStage2.add(msg.value);
        // notify the world
        RaisedStage2(_toAddr, msg.value);
      } else {
        participantList[_toAddr].contributedAmountStage3 = participantList[_toAddr].contributedAmountStage3.add(msg.value);
        // notify the world
        RaisedStage3(_toAddr, msg.value);
      }
    }
    // compute the fraction of ETH going to op account
    uint256 opEth = (PRCT100_ETH_OP.mul(msg.value)).div(10000);
    // transfer to op account 
    opVaultAddr.transfer(opEth);
    // transfer to reserve account 
    reserveVaultAddr.transfer(opEth);
  }
}