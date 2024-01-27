contract c18671{
  // Modifier to only allow the collection
  // of bet payouts when winner is determined,
  // (or withdrawals if the bet is canceled)
  modifier collectionsEnabled() {
    require (canceled || (winningOption != 2 && completed && now > BETTING_CLOSES));
    _;
  }
}