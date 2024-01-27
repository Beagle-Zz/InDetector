contract c8182{
  // Modifier to only allow the execution of
  // owner payout when winner is determined
  modifier canPayOwners() {
    require (!canceled && winningOption != 2 && completed && !ownersPayed && now > BETTING_CLOSES);
    _;
  }
}