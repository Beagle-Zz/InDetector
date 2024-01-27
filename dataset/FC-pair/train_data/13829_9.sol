contract c13829{
  // remove current round, params only - it does not refund any ETH!
  function removeCurrentIcoRound() public onlyOwner {
    require(icoRounds[rNo].rEthPaymentsAmount == 0); // only if there was no payment already
	require(!icoRounds[rNo].roundCompleted); // only current round can be removed
    icoInProgress = false;
    icoRounds[rNo].rMinEthPayment = 0;
    icoRounds[rNo].rKrsUsdFixed = 0;
    icoRounds[rNo].rKycTreshold = 0;
    icoRounds[rNo].rMinKrsCap = 0;
    icoRounds[rNo].rMaxKrsCap = 0;
    icoRounds[rNo].rStartBlock = 0;
    icoRounds[rNo].rEndBlock = 0;
    icoRounds[rNo].rEthPaymentsAmount = 0;
    icoRounds[rNo].rEthPaymentsCount = 0;
    icoRounds[rNo].rSentKrownsAmount = 0;
    icoRounds[rNo].rSentKrownsCount = 0;
    if(rNo > 0) rNo -= 1;
  }
}