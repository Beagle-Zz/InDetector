contract c8162{
  // Function that lets betters collect their
  // money, either if the bet was canceled,
  // or if they won.
  function collect() public collectionsEnabled {
    address better = msg.sender;
    require(betterInfo[better].betAmount > 0);
    require(!betterInfo[better].withdrawn);
    require(canceled != completed);
    require(canceled || (completed && betterInfo[better].betOption == winningOption));
    require(now >= (winnerDeterminedDate + 600));
    uint payout = 0;
    if (!canceled) {
      // On top of their original bet,
      // add in profit, which is a weighted
      // proportion of the losing pot, relative
      // to their contribution to the winning pot,
      // minus owner commission.
      uint losingChunk = totalAmountsBet[1 - winningOption];
      payout = betterInfo[better].betAmount + (betterInfo[better].betAmount * (losingChunk - ownerPayout) / totalAmountsBet[winningOption]) - collectionFees;
    }
    else {
      payout = betterInfo[better].betAmount;
    }
    if (payout > 0) {
      better.transfer(payout);
      betterInfo[better].withdrawn = true;
      numCollected++;
    }
  }
}