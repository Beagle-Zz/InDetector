contract c2115{
  /**
   * @dev Allows for the beneficiary to withdraw their funds, rejecting
   * further deposits.
   */
  function reachGoal() public onlyOwner {
    require(state == State.Active);
    state = State.Reached;
    emit Reached();
  }
}