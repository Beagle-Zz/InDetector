contract c7949{
  // Returns whether winning collections are
  // now available, or not.
  function collectionsAvailable() public constant returns(bool) {
    return (completed && winningOption != 2 && now >= (winnerDeterminedDate + 600)); // At least 10 mins has to pass between determining winner and enabling payout, so that we have time to revert the bet in case we detect suspicious betting activty (eg. a hacker bets a lot to steal the entire losing pot, and hacks the oracle)
  }
}