contract c18255{
  // Check if refunds are possible.
  function canRefund() public view returns(bool) {
    bool winnerNotAnnouncedInTime = (now > ANNOUNCE_WINNER_DEADLINE) && !winnerConfirmed;
    bool notExpired = (now <= CLAIM_DEADLINE);
    return (refundsEnabled || winnerNotAnnouncedInTime) && notExpired;
  } 
}