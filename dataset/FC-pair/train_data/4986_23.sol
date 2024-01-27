contract c4986{
  // Cancel bet and relase all the bets back to
  // the betters if, for any reason, payouts cannot be
  // completed. (For example Oracle fails.) Triggered by owners.
  function cancel() private {
    canceled = true;
    completed = false;
  }
}