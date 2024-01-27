contract c11298{
  // Is completed
  modifier is_crowdfund_completed() {
    if (!isCrowdfundCompleted()) revert();
    _;
  }
}