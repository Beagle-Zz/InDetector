contract c8763{
  // Modifier to only allow emptying
  // the remaining value of the contract
  // to owners.
  modifier canEmptyRemainings() {
    require(canceled || completed);
    uint numRequiredToCollect = canceled ? (numberOfBets[0] + numberOfBets[1]) : numberOfBets[winningOption];
    require ((now >= RETURN_DATE && !canceled) || (numCollected == numRequiredToCollect));
    _;
  }
}